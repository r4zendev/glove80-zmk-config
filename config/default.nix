{ pkgs ?  import <nixpkgs> {} }:

let
  firmware = import ../src {};
  config = ./.;

  glove80_left  = firmware.zmk.override { board = "glove80_lh"; keymap = "${config}/r4zen.keymap"; };
  glove80_right = firmware.zmk.override { board = "glove80_rh"; keymap = "${config}/r4zen.keymap"; };

in firmware.combine_uf2 glove80_left glove80_right
