{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openjdk21 
    # = JRE (JVM, Bibliotheken, Runtime-Environment)
    # + javac (Compiler), Debugger, jar, javadoc, Bibliotheken
    
    #maven
    #gradle
  ];

  #environment.sessionVariables = {
   #   JAVA_HOME = "${pkgs.openjdk21}/";
 # };#
}
