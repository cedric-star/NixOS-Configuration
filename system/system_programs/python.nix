{ config, pkgs, ... }:

let
  featuretools = pkgs.python3.pkgs.buildPythonPackage rec {
    pname = "featuretools";
    version = "1.27.0";
    format = "setuptools";
    
    src = pkgs.fetchPypi {
      inherit pname version;
      hash = "sha256-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX="; # Ersetze mit tatsächlichem Hash
    };
    
    propagatedBuildInputs = with pkgs.python3.pkgs; [
      pandas
      numpy
      scipy
      tqdm
      click
      cloudpickle
      distributed
      psutil
      dask
      pyyaml
    ];
    
    doCheck = false; # Oft bei komplexen Paketen besser
  };
  
  myPython = pkgs.python3.withPackages (ps: with ps; [
    pandas
    matplotlib
    plotly
    numpy
    dtw-python
    sklearn-compat
    jupyter
    
    # Hier fügen wir unser custom Paket hinzu
    featuretools
  ]);
in
{
  environment.systemPackages = with pkgs; [
    myPython
  ];
}