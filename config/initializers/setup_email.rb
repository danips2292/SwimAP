ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = 
    {
    address: "smtp.gmail.com",
    port: 587,
    domain: "swimtec.herokuapps.com",
    user_name: "swimtecapp@gmail.com",
    password: "itcrapp2017",
    authentication: "plain",
    openssl_verify_mode: 'none',
    enable_starttls_auto: true 
} 