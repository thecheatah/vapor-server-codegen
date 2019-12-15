package com.ravneetsingh.swagger.swift.vapor4;

import io.swagger.codegen.v3.*;

import java.util.*;

public class SwiftVapor4Codegen extends Swift4Codegen {

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
    return "SwiftVapor4";
  }

  /**
   * Returns human-friendly help for the generator.  Provide the consumer with help
   * tips, parameters here
   * 
   * @return A string value for the help message
   */
  public String getHelp() {
    return "Generates a SwiftVapor4 client library.";
  }

  public void processOpts() {
	super.processOpts();
    supportingFiles.add(new SupportingFile("routes.mustache",
    sourceFolder,
    "routes.swift"));
  }
  
  public SwiftVapor4Codegen() {
	  super();
  }
  
  public Map<String, Object> postProcessOperations(Map<String, Object> objs) {
    return super.postProcessOperations(objs);
  }
  public Map<String, Object> postProcessOperationsWithModels(Map<String, Object> objs, List<Object> allModels) {
    return super.postProcessOperationsWithModels(objs, allModels);
  }
}