#!/bin/env sh

/bin/grep -q -F 'pipcorn' $HOME/.profile || /bin/echo "alias pip='pipcorn() { if [[ \"\$1\" =~ ^[install]$ ]]; then /opt/conda/bin/pip install --user \"\${@:2}\"; else /opt/conda/bin/pip \"\$@\"; fi }; pipcorn'" >> $HOME/.profile
