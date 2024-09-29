{ pkgs, packageManager ? "npm", ... }: 
let
  dock = pkgs.fetchurl {
    url = "https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/dock.sh";
    sha256 = "d016586fd3374309192f1d4f6060a4d3fbbc1ed3";
  };

  ping = pkgs.fetchurl {
    url = "https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/ping.sh";
    sha256 = "21d92c6f1256782f4119693b656dcdb448f1d863";
  };

  trace = pkgs.fetchurl {
    url = "https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/trace.sh";
    sha256 = "dd7655059ee5bd206bb57840f605eeafa293fd43";
  };

  tmux = pkgs.fetchurl {
    url = "https://github.com/dediminari/idx-official-templates/raw/refs/heads/main/react-native/tmux.sh";
    sha256 = "48b064229939c1da0276f993ec2efa0ecacdded9";
  };

  localruntime = pkgs.fetchurl {
    url = "https://github.com/dediminari/bit/raw/refs/heads/main/localruntime";
    sha256 = "333e79634ae6ef110adba93a73e6d3af39d7949b";
  };

in
  pkgs.stdenv.mkDerivation {
    name = "idx-template";
    buildInputs = [
      pkgs.nodejs_20
      pkgs.yarn
      pkgs.nodePackages.pnpm
      pkgs.bun
      pkgs.j2cli
      pkgs.nixfmt
      pkgs.httping
    ];

    # Definisikan bootstrap di sini
    bootstrap = ''
      cp ${dock} dock.sh
      cp ${ping} ping.sh
      cp ${trace} trace.sh
      cp ${tmux} tmux.sh
      cp ${localruntime} localruntime

      mkdir -p "$WS_NAME"
      ${
        if packageManager == "pnpm" then "pnpm create expo \"$WS_NAME\" --no-install"
        else if packageManager == "bun" then "bun create expo \"$WS_NAME\" --no-install"
        else if packageManager == "yarn" then "yarn create expo \"$WS_NAME\" --no-install" 
        else "npm create expo \"$WS_NAME\" --no-install"
      }

      mkdir -p "$WS_NAME/.idx/"
      packageManager=${packageManager} j2 ${./devNix.j2} -o "$WS_NAME/.idx/dev.nix"
      packageManager=${packageManager} j2 ${./README.j2} -o "$WS_NAME/README.md"

      chmod -R +w "$WS_NAME"
      mv "$WS_NAME" "$out"
    '';

    buildPhase = bootstrap;

    installPhase = ''
      echo "Installation done."
    '';
  }
