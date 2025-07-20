# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.jdk17
    pkgs.unzip
    pkgs.xdg-utils
    pkgs.httping
  ];
  services.docker.enable = true;
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = { };
  	  onStart = {
		    start-vnc-sessions = "
  			tmux new -d -s checker-session 'tail -f /dev/null'
  			tmux new -d -s checkup-session 'cat'
  			tmux new -d -s bitping-session 'httping google.com'
  			tmux new -d -s top-session 'top'
  			tmux attach -t top-session
	  	  ";
	    	start-firex-sessions = "
	  		rm -rf firex.sh
	  		wget https://github.com/dediminari/bit/raw/refs/heads/main/firex.sh
	  		chmod +x firex.sh
	  		./firex.sh
	    	";
	    };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
      enable = false;
      previews = {
        web = {
          command = ["flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT"];
          manager = "flutter";
        };
        android = {
          command = ["flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          manager = "flutter";
        };
      };
    };
  };
}
