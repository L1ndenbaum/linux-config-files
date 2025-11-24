#!/bin/bash

set -euo pipefail

LOCAL_DOT_DESKTOP_DIR="$HOME/.local/share/applications"
LOCAL_BIN_DIR="$HOME/.local/bin"

if [ ! -d "$LOCAL_BIN_DIR" ]; then
    mkdir -p "$LOCAL_BIN_DIR"
fi

if [ ! -d "$LOCAL_DOT_DESKTOP_DIR" ]; then
	mkdir -p "$LOCAL_DOT_DESKTOP_DIR"
fi

cat <<'EOF' > "$LOCAL_BIN_DIR/code"
#!/bin/bash

# 固定加的参数
EXTRA_FLAGS=(
  --ozone-platform=wayland
  --enable-features=WaylandWindowDecorations
)

exec /usr/bin/code "${EXTRA_FLAGS[@]}" "$@"
EOF

chmod +x "$LOCAL_BIN_DIR/code"

cat <<EOF > "$LOCAL_DOT_DESKTOP_DIR/code.desktop"
[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=$HOME/.local/bin/code %F
Icon=visual-studio-code
Type=Application
StartupNotify=false
StartupWMClass=Code
Categories=TextEditor;Development;IDE;
MimeType=application/x-code-workspace;
Actions=new-empty-window;
Keywords=vscode;

[Desktop Action new-empty-window]
Name=New Empty Window
Name[cs]=Nové prázdné okno
Name[de]=Neues leeres Fenster
Name[es]=Nueva ventana vacía
Name[fr]=Nouvelle fenêtre vide
Name[it]=Nuova finestra vuota
Name[ja]=新しい空のウィンドウ
Name[ko]=새 빈 창
Name[ru]=Новое пустое окно
Name[zh_CN]=新建空窗口
Name[zh_TW]=開新空視窗
Exec=$HOME/.local/bin/code --new-window %F
Icon=visual-studio-code
EOF

cat <<EOF > "$LOCAL_DOT_DESKTOP_DIR/code-url-handler.desktop"
[Desktop Entry]
Name=Visual Studio Code - URL Handler
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=$HOME/.local/bin/code --open-url %U
Icon=visual-studio-code
Type=Application
NoDisplay=true
StartupNotify=true
Categories=Utility;TextEditor;Development;IDE;
MimeType=x-scheme-handler/vscode;
Keywords=vscode;
EOF
