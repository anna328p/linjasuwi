{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    librsvg
    nodePackages.svgo
  ];
}
