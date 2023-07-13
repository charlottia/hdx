{
  pkgs,
  stdenv,

  python,
  git,

  icestorm_rev,
  icestorm_git_sha256,
}:

stdenv.mkDerivation {
  name = "icestorm";

  src = pkgs.fetchgit {
    name = "icestorm";
    url = "https://github.com/YosysHQ/icestorm.git";
    rev = icestorm_rev;
    sha256 = icestorm_git_sha256;
  };

  makeFlags = [
    "PREFIX=$(out)"
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
    python
    libftdi
  ];
}
