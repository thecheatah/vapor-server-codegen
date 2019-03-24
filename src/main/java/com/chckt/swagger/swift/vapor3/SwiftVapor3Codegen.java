package com.chckt.swagger.swift.vapor3;

import io.swagger.codegen.v3.*;
import io.swagger.codegen.v3.generators.DefaultCodegenConfig;

import java.util.*;
import java.io.File;

public class SwiftVapor3Codegen extends Swift4Codegen {

  /**
   * Configures the type of generator.
   * 
   * @return  the CodegenType for this generator
   * @see     io.swagger.codegen.CodegenType
   */
  public CodegenType getTag() {
    return CodegenType.SERVER;
  }

  /**
   * Configures a friendly name for the generator.  This will be used by the generator
   * to select the library with the -l flag.
   * 
   * @return the friendly name for the generator
   */
  public String getName() {
    return "SwiftVapor3";
  }

  /**
   * Returns human-friendly help for the generator.  Provide the consumer with help
   * tips, parameters here
   * 
   * @return A string value for the help message
   */
  public String getHelp() {
    return "Generates a SwiftVapor3 client library.";
  }

  public void processOpts() {
	super.processOpts();
    supportingFiles.add(new SupportingFile("routes.mustache",
    sourceFolder,
    "routes.swift"));
  }
  
  public SwiftVapor3Codegen() {
	  super();
  }
}