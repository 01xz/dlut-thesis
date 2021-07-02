# dlut-thesis

![](https://img.shields.io/badge/dlut_thesis-LaTeX-red.svg?style=flat-square&colorA=0173bc)

LaTeX Thesis Template for Dalian University of Technology.

## install
This project uses [MiKTeX](https://miktex.org/) and [VS Code](https://code.visualstudio.com/). Go check them out if you don't have them locally installed.

### LaTeX Workshop
1. Install [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) in Marketplace of VS Code.
2. Add following configuration to your settings file (~\AppData\Roaming\Code\User\settings.json):

```json
    // Latex workshop 
    "latex-workshop.latex.recipes": [
        {
            "name": "texify",
            "tools": [
                "texify"
            ]
        },
        {
            "name": "xelatex",
            "tools": [
                "xelatex"
            ]
        },
        {
            "name": "xe->bib->xe->xe",
            "tools": [
                "xelatex",
                "bibtex",
                "xelatex",
                "xelatex"
            ]
        }
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "texify",
            "command": "texify",
            "args": [
                "--synctex",
                "--pdf",
                "--tex-option=\"-interaction=nonstopmode\"",
                "--tex-option=\"-file-line-error\"",
                "%DOC%.tex"
            ]
        },
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        },
        {
            "name": "pdflatex",
            "command": "pdflatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        },
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": [
                "%DOCFILE%"
            ]
        }
    ],
    "latex-workshop.latex.clean.enabled": true,
```

3. It is highly recommended to install [SumatraPDF](https://www.sumatrapdfreader.org/free-pdf-reader) for viewing pdf files. Add following configuration to your settings file to make sure it works:

```json
    "latex-workshop.view.pdf.viewer": "external",
    "latex-workshop.view.pdf.external.viewer.command": ".../SumatraPDF.exe",
    "latex-workshop.view.pdf.external.viewer.args": [
        "-forward-search",
        "%TEX%",
        "%LINE%",
        "-reuse-instance",
        "-inverse-search",
        "\".../Microsoft VS Code/code.exe\" \".../Microsoft VS Code/resources/app/out/cli.js\" -gr \"%f\":\"%l\"",
        "%PDF%"
    ],
    "latex-workshop.view.pdf.external.synctex.command": ".../SumatraPDF.exe",
    "latex-workshop.view.pdf.external.synctex.args": [
        "-forward-search",
        "%TEX%",
        "%LINE%",
        "-reuse-instance",
        "-inverse-search",
        "\".../Microsoft VS Code/Code.exe\" \".../Microsoft VS Code/resources/app/out/cli.js\" -gr \"%f\":\"%l\"",
        "%PDF%",
    ],
	// remeber to replace ... to your installation path
```

## References
- [DLUT_XeLaTeX_Template_For_Bachelor](https://github.com/stevewongv/DLUT_XeLaTeX_Template_For_Bachelor)
- [thuthesis](https://github.com/tuna/thuthesis) - LaTeX Thesis Template for Tsinghua University.

## License
[Apache-2.0 License](LICENSE) © 01xz
