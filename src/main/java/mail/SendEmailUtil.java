package mail;

import com.sendgrid.*;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;
import io.github.cdimascio.dotenv.Dotenv;

import java.io.IOException; //tránh lộ key API khi tui push

public class SendEmailUtil {
    // Thay YOUR_SENDGRID_API_KEY bằng API Key
    private static final String SENDGRID_API_KEY = Dotenv.load().get("SENDGRID_API_KEY");

    public static void sendPasswordResetEmail(String toEmail, String resetLink) throws IOException {
        // Địa chỉ email đã được xác minh trong SendGrid
        Email from = new Email("huynguyen1723@gmail.com");
        String subject = "Password Reset Request";
        Email to = new Email(toEmail);
        Content content = new Content("text/plain", "Please reset your password by clicking the following link: " + resetLink);
        Mail mail = new Mail(from, subject, to, content);

        SendGrid sg = new SendGrid(SENDGRID_API_KEY);
        Request request = new Request();

        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
            Response response = sg.api(request);
            System.out.println("Email sent with status code: " + response.getStatusCode());
        } catch (IOException ex) {
            throw ex;
        }
    }
}

