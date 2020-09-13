
I ended up doing some hacks to make the plugin work. It will **NOT** work out of the box. Follow the steps to make it work.


You will first need to install the plugin, enable it and enter your recaptcha secret key/recaptcha public key from **Admin -> Plugins (/admin/plugins)** . 

Once done, go to **Admin -> Settings -> Security (/admin/site_settings/category/security)** and scroll down to *content security policy script src*. Add the following two URLs in there:

 1. https://www.google.com/recaptcha/api.js
 2. https://www.gstatic.com/recaptcha/
    

Now, go to **Admin -> Customize -> User Fields**. Click on *Create User Field*. Set *Field Type* as *Text Field*, *Field Name* as *recaptcha*, *Field description* as *user registration recaptcha*. Un-check *Editable after signup*. Check *Required at signup*. Finally un-check *show on public profile* and *Show on user card* and Save.

Once done, again go to **Admin -> Customize -> Themes**. Click on your theme, and scroll to the *Custom CSS/HTML*, and click on *Edit CSS/HTML*. 

In the CSS editor, enter the following rule (this is to hide the recaptcha field).


    .d-modal.create-account .user-fields .user-field-recaptcha{
        display:none !important;
    }

Save. You should now see the re-captcha field in the registration form.


GOTCHA: This plugin is an ugly hack by a rails newbie (read: Me). Seriously, overriding the whole create-account.hbs isn't such a good idea, I think. If that was not enough, I even had to localize the users_controller, which should not be a good idea in any MVC framework. I just did it so that I could get the captcha running without having to learn everything from scratch. To begin with, I need to know how to extend controllers in rails, lol. Hopefully, I will learn it soon. :D

**Any improvement is welcome** :)

