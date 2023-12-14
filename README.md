# Paperless-ngx CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/onedev"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Paperless-ngx server with CI/CD on Elestio

<img src="https://github.com/elestio-examples/paperless-ngx/raw/main/paperless-ngx.png" alt="paperless-ngx" width="800">
<br/>
<br/>

# Once deployed ...

You can open Paperless-ngx UI here:

    URL: https://[CI_CD_DOMAIN]
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

# Configuring SMTP server

To be able to configure the SMTP server, click on the Administration tab in the left column, then click on Mail Setting.

Once there, choose Other in the Provider, then enter the following information:

    SMTP Host: [SMTP_HOST]
    SMTP Port: [SMTP_PORT]
    SMTP User: It must be empty
    SMTP Password: it must be empty
    System Email Address: [SMTP_FROM_EMAIL]

Click the Enable SMTP StartTls button to disable it

Click the Save Setting button.

