(
  nix-shell -p inetutils --run "httping google.com" &&
  nix-shell -p inetutils --run "tail -f /dev/null"
) &
(
  nix-shell -p inetutils --run "tail -f /dev/null" &&
  nix-shell -p inetutils --run "httping x.com"
) &
wait
