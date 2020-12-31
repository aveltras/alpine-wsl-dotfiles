{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "scaleway-cli";
  version = "2.2.3";

  src = fetchurl {
    url = "https://github.com/scaleway/scaleway-cli/releases/download/v${version}/scw-${version}-linux-x86_64";
    sha256 = "11jl3acwl7fxhd42640hfijmj9qicyad9ixkrx2k6nfakznaf7w5";
  };

  phases = ["installPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/scw
    chmod +x $out/bin/scw
  '';

  meta = with stdenv.lib; {
    description = "Interact with Scaleway API from the command line";
    homepage = "https://github.com/scaleway/scaleway-cli";
    license = licenses.mit;
    maintainers = with maintainers; [ nickhu ];
  };
}