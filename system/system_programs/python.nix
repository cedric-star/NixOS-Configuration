{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python311.withPackages (ps: with ps; [
      pandas
      matplotlib
      plotly
      numpy
      dtw-python
      sklearn-compat
      pyserial-asyncio

      pip
      setuptools
      

      jupyter
    ]))
  ]
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      pandas
      matplotlib
      plotly
      numpy
      dtw-python
      sklearn-compat
      pyserial-asyncio

      pip
      setuptools
      

      jupyter
    ]))# pakete in python direkt einbinden
  ];
}

#run:   jupyter notebook --notebook-dir=./
#dann:  url mit token ganz am anfang aus consolenausgabe in codium einfügen (existing jupyter server)