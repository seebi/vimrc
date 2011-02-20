"===============================================================
" RDF Vocabulary/Model Omni-Completion for Vim 7+
" Maintainer: Niklas Lindström <lindstream@gmail.com>
" Version: 1.0.1
" Last Updated: 2007-03-25
"===============================================================
"
" USAGE:
" In a file with namespace prefix declarations similar to XML, Turtle/Notation3
" or SPARQL, call
"
"   :RDF
"
" to turn on completion on terms within a namespace using the preceding prefix.
" This will load all RDF/XML and n3-files found in one of the following dirs:
"
"   - $RDF_MODEL_FILES (environment variable)
"   - ~/rdfmodels/
"   - ~/Documents/rdfmodels/
"   - /usr/local/share/rdfmodels/
"
" Call
"
"   :RDF reload
"
" to reload model files, and
"
"   :RDF quit
"
" to restore the original omnifunc (if any).
"
" REQUIRES:
" Vim compiled with Python and RDFLib installed for Python.
"
"===============================================================


if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif


func! s:DefPython()
python <<ENDPY
import vim
import re
import os
try:
    from rdflib import ConjunctiveGraph, RDF, RDFS, Namespace
    OWL = Namespace("http://www.w3.org/2002/07/owl#")
except ImportError:
    print "Requires rdflib."


class RdfnsLibrary(object):

    MAX_LINE_SCAN = 42
    MATCH_NS_DECL = re.compile(r'''(?:@prefix\s+|xmlns:?|PREFIX\s+)(\w*)[:=]\s*[<"'"](.+?)[>"']''')
    MATCH_URI_LEAF = re.compile(r'(.+[#/])([A-Za-z0-9_-]+)$')

    _instance = None

    @classmethod
    def get_instance(cls, basedir):
        if not cls._instance:
            cls._instance = cls(basedir)
        cls._instance.collect_namespaces()
        return cls._instance

    def __init__(self, basedir):
        self.basedir = basedir
        self.rdfns_prefixes = {}
        self.rdfns_namespaces = {}
        self.load_vocabularies(basedir)

    def get_vocabulary(self, prefix):
        ns = self.rdfns_prefixes.get(prefix)
        vocab = self.rdfns_namespaces.get(ns)
        return vocab

    def collect_namespaces(self, refetch=False):
        pfxns = self.rdfns_prefixes = {}
        for i, line in enumerate(vim.current.buffer):
            if i > self.MAX_LINE_SCAN:
                break
            for pfx, ns in self.MATCH_NS_DECL.findall(line):
                pfxns[pfx] = ns

    def load_vocabularies(self, basedir=None):
        basedir = basedir or self.basedir
        for fname in os.listdir(basedir):
            fpath = os.path.join(basedir, fname)
            if os.path.isfile(fpath):
                graph = ConjunctiveGraph()
                try:
                    graph.load(fpath,
                            format=['xml', 'n3'][fname.endswith('.n3')])
                except Exception, e:
                    print "Error loading <%s>: %s" % (fpath, e)
                else:
                    self._load_vocabulary(graph)
        self._sort_terms()

    def _load_vocabulary(self, graph):
        nss = self.rdfns_namespaces
        items = set(graph.subjects(RDF.type, None))
        for subject in items:
            uri, leaf = self.split_uri(subject)
            if uri and leaf:
                nss.setdefault(uri, []).append(leaf)

    def _sort_terms(self):
        for terms in self.rdfns_namespaces.values():
            terms.sort()

    @classmethod
    def split_uri(cls, uri):
        uri = unicode(uri)
        for base, leaf in cls.MATCH_URI_LEAF.findall(uri):
            return base, leaf
        return None, None


def vimcomplete_rdfns(context, match):
    completions = get_rdfns_completions(context, match)
    vimDictRepr = '['
    for cmpl in completions:
        vimDictRepr += '{'
        for kv in cmpl.items():
            vimDictRepr += '"%s": "%s",' % kv
        vimDictRepr += '"icase": 0},'
    if vimDictRepr[-1] == ',':
        vimDictRepr = vimDictRepr[:-1]
    vimDictRepr += ']'
    vim.command("silent let g:rdfns_complete_completions = %s" % vimDictRepr)


def get_rdfns_completions(context, match):
    basedir = get_rdf_model_dir()
    library = RdfnsLibrary.get_instance(basedir)

    completions = []

    prefix = context.split(':')[0]
    vocab = library.get_vocabulary(prefix) or []

    pfxs = []
    if not ':' in context:
        pfxs += [k+':' for k in sorted(library.rdfns_prefixes.keys())]

    for name in pfxs + vocab:
        if name.startswith(match):
            compl = {'word': name}#, 'menu': menu}#, 'info': info}
            completions.append(compl)

    return completions


# TODO: configure better
RDF_MODEL_DIRS = [
        os.environ.get('RDF_MODEL_FILES', ''),
        '~/.vim/rdfmodels',
        '~/rdfmodels',
        '~/Documents/rdfmodels',
        '/usr/local/share/rdfmodels/'
    ]

def get_rdf_model_dir():
    for fpath in RDF_MODEL_DIRS:
        fpath = os.path.expanduser(fpath)
        if os.path.isdir(fpath):
            return fpath

ENDPY
endfunc


call s:DefPython()


"-----------------------------------------------------------------------


func! RdfnsComplete(findstart, base)
    let line = getline('.')
    let cpos = col('.') - 1

    " 1 - get the text length
    if a:findstart == 1
        while cpos > 0 && line[cpos - 1] =~ '\a'
            let cpos -= 1
        endwhile
        return cpos

    " 0 - return the list of completions
    else
        let context = ''
        while cpos > 0
            let cpos -= 1
            let c = line[cpos]
            if c =~ '\w' || c =~ '\:'
                let context = c . context
                continue
            elseif strlen(context) > 0 || cpos == 0
                break
            endif
        endwhile
        execute "python vimcomplete_rdfns('" . context . "', '" . a:base . "')"
        return g:rdfns_complete_completions

    endif
endfunc

func! s:RdfnsReload()
    python RdfnsLibrary.get_instance(get_rdf_model_dir()).load_vocabularies()
endfunc


"=======================================================================


" TODO: Keep only this in plugin/rdfnscomplete.vim, move major bulk into
" autoload/rdfns.vim and use rdfns#<FuncName> here.

" <none> | reload | quit
func! s:Rdfns(...)
    if a:0 == 0
        let b:rdfns_saved_omnifunc = &omnifunc
        setlocal omnifunc=RdfnsComplete
    elseif a:1 == 'reload'
        call <SID>RdfnsReload()
    elseif a:1 == 'quit'
        if exists('b:rdfns_saved_omnifunc')
            let &omnifunc=b:rdfns_saved_omnifunc
            unlet b:rdfns_saved_omnifunc
        endif
    endif
endfunc

func! RdfnsArgs(A,L,P)
    return ["reload", "quit"]
endfunc

command! -complete=customlist,RdfnsArgs -nargs=* RDF :call <SID>Rdfns(<f-args>)


