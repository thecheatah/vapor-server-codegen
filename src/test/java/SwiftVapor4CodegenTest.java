import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import org.testng.Assert;
import org.testng.annotations.Test;

import io.swagger.codegen.v3.cli.SwaggerCodegen;


public class SwiftVapor4CodegenTest {

  @Test
  public void allTest() throws InterruptedException, IOException {
    //Build from the test swagger
    SwaggerCodegen.main(new String[]{"generate", "-l", "SwiftVapor4", "-i", "AllTest/codegen_test.yml", "-o", "./target/test-classes/AllTest/VaporTestInterface", "--additional-properties", "projectName=VaporTestInterface"});
    //The previous command runs in a thread. Wait about 4 seconds for the thread to finish
    //TODO: Make the previous command blocking
    Thread.sleep(4000L);

    //Run swift test to run the test cases in the VaporTestServer
    ProcessBuilder pb = new ProcessBuilder("/usr/bin/swift", "test");
//    pb.directory(new File("./target/test-classes/AllTest/VaporTestServer"));
    pb.directory(new File("./src/test/resources/AllTest/VaporTestServer"));
    pb.redirectOutput(Redirect.INHERIT);
    pb.redirectError(Redirect.INHERIT);
    Process p = pb.start();
    int result = p.waitFor();

    System.out.println("Exit Value: " + result);
    Assert.assertEquals(result, 0);
  }

  @Test
  public void withoutAuthenticationTest() throws InterruptedException, IOException {
    //Build from the test swagger
    SwaggerCodegen.main(new String[]{"generate", "-l", "SwiftVapor4", "-i", "WithoutAuthTest/codegen_test.yml", "-o", "./target/test-classes/WithoutAuthTest/VaporTestInterface", "--additional-properties", "projectName=VaporTestInterface"});
    //The previous command runs in a thread. Wait about 4 seconds for the thread to finish
    //TODO: Make the previous command blocking
    Thread.sleep(4000L);

    //Run swift test to run the test cases in the VaporTestServer
    ProcessBuilder pb = new ProcessBuilder("/usr/bin/swift", "test");
//    pb.directory(new File("./target/test-classes/WithoutAuthTest/VaporTestServer"));
    pb.directory(new File("./src/test/resources/WithoutAuthTest/VaporTestServer"));
    pb.redirectOutput(Redirect.INHERIT);
    pb.redirectError(Redirect.INHERIT);
    Process p = pb.start();
    int result = p.waitFor();

    System.out.println("Exit Value: " + result);
    Assert.assertEquals(result, 0);
  }
}
