import com.ericsson.otp.erlang.*;

public class ClientNode {
    public static void main (String[] _args) throws Exception{
        OtpSelf cNode = new OtpSelf("clientnode", "cookie");
        OtpPeer sNode = new OtpPeer("servernode@DESKTOP-TUBUPV1");
        OtpConnection connection = cNode.connect(sNode);
        OtpErlangObject[] args = new OtpErlangObject[]
                {new OtpErlangLong(1), new OtpErlangLong(2)};
        connection.sendRPC("mathserver", "add", args);
        OtpErlangLong sum = (OtpErlangLong) connection.receiveRPC();
        System.out.println(sum.intValue());
    }
}




