import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import org.testng.Assert;
import org.testng.annotations.Test;

import io.swagger.codegen.v3.cli.SwaggerCodegen;


public class SwiftVapor3CodegenTest {

  @Test
  public void simpleTest() throws InterruptedException, IOException {
    SwaggerCodegen.main(new String[]{"generate", "-l", "SwiftVapor3", "-i", "codegen_test.yml", "-o", "./target/test-classes/swift/VaporTestInterface", "--additional-properties", "projectName=VaporTestInterface"});
    Thread.sleep(4000L);
    ProcessBuilder pb = new ProcessBuilder("/usr/bin/swift", "test");
//    pb.directory(new File("./target/test-classes/swift/VaporTestServer"));
    pb.directory(new File("./src/test/resources/swift/VaporTestServer"));
    pb.redirectOutput(Redirect.INHERIT);
    pb.redirectError(Redirect.INHERIT);
    Process p = pb.start();
    int result = p.waitFor();

//    Process p = Runtime.getRuntime().exec("/usr/bin/swift build", null, new File("target/test-classes/swift/VaporTestServer"));
//    int result = p.waitFor();
//    while (p.getInputStream().)
//    byte[] b = p.getInputStream().readAllBytes();
//    System.out.write(b);
    System.out.println(result);
    Assert.assertEquals(result, 0);
  }
}
