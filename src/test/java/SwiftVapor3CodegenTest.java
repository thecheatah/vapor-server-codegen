import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import org.testng.Assert;
import org.testng.annotations.Test;

import io.swagger.codegen.v3.cli.SwaggerCodegen;


public class SwiftVapor3CodegenTest {

  @Test
  public void simpleTest() throws InterruptedException, IOException {
    //Build from the test swagger
    SwaggerCodegen.main(new String[]{"generate", "-l", "SwiftVapor3", "-i", "codegen_test.yml", "-o", "./target/test-classes/swift/VaporTestInterface", "--additional-properties", "projectName=VaporTestInterface"});
    //The previous command runs in a thread. Wait about 4 seconds for the thread to finish
    //TODO: Make the previous command blocking
    Thread.sleep(4000L);

    //Run swift test to run the test cases in the VaporTestServer
    ProcessBuilder pb = new ProcessBuilder("/usr/bin/swift", "test");
    pb.directory(new File("./src/test/resources/swift/VaporTestServer"));
    pb.redirectOutput(Redirect.INHERIT);
    pb.redirectError(Redirect.INHERIT);
    Process p = pb.start();
    int result = p.waitFor();

    System.out.println(result);
    Assert.assertEquals(result, 0);
  }
}
