# LuaLaTeX using Windows System Fonts in WSL on Windows 11

To make LuaLaTeX running on a Windows Subsystem for Linux (WSL) instance on Windows 11 use a font installed on the Windows 11 host system, you need to configure the font system within WSL to recognize the Windows font directory and then specify the font in your LuaLaTeX document. Here’s a step-by-step guide:

### 1. Ensure LuaLaTeX is Installed in WSL

First, confirm that you have a TeX distribution (like TeX Live) installed in your WSL environment. If not, you can install it. For example, on an Ubuntu-based WSL instance:

~~~bash
sudo apt update
sudo apt install texlive-full
~~~

This installs LuaLaTeX along with other TeX tools.

### 2. Locate the Windows Font Directory

Windows fonts are typically stored in `C:\Windows\Fonts`. In WSL, this directory is accessible under `/mnt/c/Windows/Fonts` because WSL automatically mounts the Windows drives under `/mnt`.

### 3. Configure Fontconfig to Use Windows Fonts

Fontconfig is the library LuaLaTeX (via `luaotfload`) uses to locate system fonts. You need to tell Fontconfig to include the Windows font directory.

- Create or edit a Fontconfig configuration file in your WSL home directory:

  ~~~bash
  mkdir -p ~/.config/fontconfig
  nano ~/.config/fontconfig/fonts.conf
  ~~~

- Add the following content to `fonts.conf`:

  ~~~xml
  <?xml version="1.0"?>
  <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
  <fontconfig>
      <dir>/mnt/c/Windows/Fonts</dir>
  </fontconfig>
  ~~~

  This directs Fontconfig to look for fonts in the Windows font directory.

- Update the Fontconfig cache to include the new directory:

  ~~~bash
  fc-cache -fv
  ~~~

  This command rebuilds the font cache, and you should see `/mnt/c/Windows/Fonts` listed as one of the scanned directories in the output.

### 4. Verify Font Availability

Check if the Windows fonts are now visible to your WSL system:

~~~bash
fc-list | grep "<font-name>"
~~~

Replace `<font-name>` with part of the name of a font installed on Windows (e.g., `Arial`, `Times New Roman`). If the font appears in the list, Fontconfig has successfully recognized it.

### 5. Use the Font in LuaLaTeX

Create a simple LuaLaTeX document to test the font. For example:

~~~latex
\documentclass{article}
\usepackage{fontspec}
\setmainfont{Arial} % Replace with the exact font name as installed on Windows
\begin{document}
Hello, world! This is a test using a Windows font.
\end{document}
~~~

Save this as `test.tex`.

- Compile the document with LuaLaTeX:

  ~~~bash
  lualatex test.tex
  ~~~

  This should generate `test.pdf`. Open the PDF (you can copy it to your Windows system with `cp test.pdf /mnt/c/Users/YourUsername/`) and verify that the font is applied correctly.

### 6. Troubleshooting

- **Font Not Found**: If LuaLaTeX can’t find the font, ensure the font name matches exactly what’s installed on Windows. You can find the precise name using `fc-list` or by checking the font properties in Windows. For example, some fonts might need to be specified as `Arial Regular` instead of just `Arial`.
- **Cache Issues**: If changes don’t take effect, rerun `fc-cache -fv` to refresh the font cache.
- **Performance**: Accessing fonts from `/mnt/c/` might be slower due to WSL’s file system bridge. If this is an issue, consider copying the font files to a Linux directory (e.g., `/usr/local/share/fonts/`) instead, though this uses additional disk space.

### Notes

- LuaLaTeX relies on `fontspec` and `luaotfload` to handle system fonts, so you must use `\usepackage{fontspec}` in your document.
- Fonts must be in a format LuaLaTeX supports, such as TrueType (`.ttf`) or OpenType (`.otf`), which most Windows fonts are.
- You don’t need to install the fonts into WSL’s font directory; linking to the Windows directory avoids duplication.

By following these steps, LuaLaTeX in your WSL instance should successfully use fonts installed on your Windows 11 host system.
