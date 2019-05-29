import com.ericsson.otp.erlang.*;

public class PingClientNode {
    public static void main (String[] _args) throws Exception{
        OtpSelf cNode = new OtpSelf("clientnode", "cookie");
        OtpPeer sNode = new OtpPeer("servernode@DESKTOP-TUBUPV1");
        OtpConnection connection = cNode.connect(sNode);
        OtpErlangObject[] args = new OtpErlangObject[]
                {new OtpErlangAtom("ping")};
        connection.sendRPC("pong", "pong", args);
        OtpErlangAtom sum = (OtpErlangAtom) connection.receiveRPC();
        System.out.println(sum.atomValue());
    }
}

