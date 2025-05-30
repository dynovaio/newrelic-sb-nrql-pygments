__all__ = ["NrqlLexer"]


import re

from pygments.lexer import RegexLexer, words
from pygments.token import (
    Comment,
    Keyword,
    Name,
    Number,
    Operator,
    Punctuation,
    String,
    Text,
)

from .builtins import FUNCTIONS, KEYWORDS, OPERATORS, WORD_OPERATORS


class NrqlLexer(RegexLexer):
    name = "NRQL"
    aliases = [
        "nrql",
    ]
    mimetypes = ["text/x-nrql"]

    flags = re.IGNORECASE
    tokens = {
        "root": [
            (
                r"\s+",
                Text,
            ),
            (
                r"--.*?\n",
                Comment.Single,
            ),
            (
                r"//.*?\n",
                Comment.Single,
            ),
            (
                r"/\*",
                Comment.Multiline,
                "multiline-comments",
            ),
            (
                r"(" + "|".join(KEYWORDS) + r")\b",
                Keyword,
            ),
            (
                r"(" + "|".join(FUNCTIONS) + r")\b",
                Name.Function,
            ),
            (
                # r"(" + "|".join(OPERATORS) + r")\b",
                words(OPERATORS),
                Operator,
            ),
            (
                r"(" + "|".join(WORD_OPERATORS) + r")\b",
                Operator.Word,
            ),
            (
                r"([0-9]*\.[0-9]*|[0-9]+)(e[+-]?[0-9]+)?",
                Number.Float,
            ),
            (
                r"[0-9]+",
                Number.Integer,
            ),
            (
                r"'(''|[^'])*'",
                String.Single,
            ),
            (
                r"r'(''|[^'])*'",
                String.Regex,
            ),
            (
                r"`([^`])*`",
                String.Backtick,
            ),
            (
                r"[a-zA-Z]+([a-zA-Z0-9_\.]*)([a-zA-Z0-9_]*)",
                Name,
            ),
            (
                r"`[a-zA-Z0-9:_]+([a-zA-Z0-9:_\.]*)([a-zA-Z0-9:_]*)`",
                Name,
            ),
            (
                r"[;:()\[\],\.]",
                Punctuation,
            ),
        ],
        "multiline-comments": [
            (r"/\*", Comment.Multiline, "multiline-comments"),
            (r"\*/", Comment.Multiline, "#pop"),
            (r"[^/\*]+", Comment.Multiline),
            (r"[/*]", Comment.Multiline),
        ],
    }
