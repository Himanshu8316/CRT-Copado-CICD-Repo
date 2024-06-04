*** Settings ***

Documentation                   Create a new Salesforce Trail
Library                         QWeb
Library                         DateTime
Library                         String
Library                         BuiltIn
Suite Setup                     Open Browser                about:blank                 chrome
Suite Teardown                  Close All Browsers


*** Variables ***

${email_address}                himanshu8316sharma@gmail.com


*** Test Cases ***
Exercise 4 - Create Salesforce Trial Org
    GoTo                        https://www.salesforce.com/form/signup/sales/

    # Handle Cookie Popup
    ${cookies_popup_present}=                               IsText                      Accept All Cookies
    Log to Console              ${cookies_popup_present}
    IF                          ${cookies_popup_present}
        ClickText               Accept All Cookies
    END

    VerifyText                  Start your free trial today

    Evaluate                    random.seed()               random
    ${exampleFirstName}=        Convert To String           guest1
    ${randomString}=            Generate Random String      length=3-5                  chars=0123456789
    ${FirstName}=               Format String               {}{}                        ${exampleFirstName}         ${randomString}


    TypeText                    First name                  ${FirstName}
    TypeText                    Last name                   user
    TypeText                    Job title                   Learner
    ClickText                   Next

    DropDown                    Employees                   21 - 200 employees
    TypeText                    Company                     xyz
    ClickText                   Next


    TypeText                    Phone                       9999999999
    TypeText                    Email                       ${email_address}
    ClickElement                //div[@class\="checkbox-ui"]

    ClickText                   Submit
    # Switch Window             NEW
    ClickText                   Training and learning to use                            timeout=60s
    ClickText                   Next
    ClickText                   Managing my pipeline
    ClickText                   Next
    ClickText                   Very familiar with Salesforce CRM software
    ClickText                   Submit

  