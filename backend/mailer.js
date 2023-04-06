const sgMailer = require('@sendgrid/mail');
sgMailer.setApiKey(process.env.SENDGRID_API_KEY);

function sendMagicLinkEmail({ email, token }) {
  return sgMailer.send({
    to: email,
    from: process.env.FROM_EMAIL,
    subject: 'Finish your logging in process',
    html: `<a href="http://localhost:5173/loggedin?token=${token}">Log in</a>`
  });
}

module.exports = {
  sendMagicLinkEmail
}