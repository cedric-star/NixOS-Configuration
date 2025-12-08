{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    (python3.withPackages (ps: with ps; [
      pandas
      matplotlib
      plotly
      numpy
      dtw-python
      sklearn-compat
      
      # PyRIT Abhängigkeiten (alle fehlenden)
      pip
      virtualenv
      python-dotenv
      requests
      openai
      tiktoken
      
      # Neue Abhängigkeiten basierend auf den Fehlern
      pydantic           # Wichtig! Fehlte in deiner Konfig
      aiofiles           # Für async Dateioperationen
      httpx              # HTTP client (oft von PyRIT benötigt)
      nest-asyncio       # Für Jupyter + async
      pillow             # Bildverarbeitung
      jinja2             # Templates
      pyyaml             # YAML Unterstützung
      redis              # Für Memory-Speicher (optional)
      sqlalchemy         # Datenbank (optional)
      pypdf              # PDF Verarbeitung
      docx2txt           # DOCX Verarbeitung
      markdown           # Markdown support
      
      # Transformers und ML
      transformers
      torch
      torchvision
      scikit-learn

      jupyter
    ]))# pakete in python direkt einbinden

  ];
}

#run:   jupyter notebook --notebook-dir=./
#dann:  url mit token ganz am anfang aus consolenausgabe in codium einfügen (existing jupyter server)