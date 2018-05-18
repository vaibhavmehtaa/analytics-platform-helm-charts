#!/bin/env sh

set -x

/bin/grep -q -F 'pipcorn' $HOME/.bash_aliases || \
    /bin/echo "alias pip='pipcorn() { if [ \$1 == \"install\" ]; then /opt/conda/bin/pip install --user \"\${@:2}\"; else /opt/conda/bin/pip \"\$@\"; fi }; pipcorn'" \
    >> $HOME/.bash_aliases

chown 1001:100 $HOME/.bash_aliases
