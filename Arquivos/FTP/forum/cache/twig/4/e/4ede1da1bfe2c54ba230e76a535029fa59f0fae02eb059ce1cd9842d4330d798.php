<?php

/* login_body.html */
class __TwigTemplate_4ede1da1bfe2c54ba230e76a535029fa59f0fae02eb059ce1cd9842d4330d798 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        $location = "overall_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_header.html", "login_body.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "    ";
        if ((isset($context["LOGIN_EXPLAIN"]) ? $context["LOGIN_EXPLAIN"] : null)) {
            // line 3
            echo "        <div class=\"alert alert-info fade in\">
           <i class=\"fa fa-warning\"></i><strong>&nbsp;";
            // line 4
            echo (isset($context["LOGIN_EXPLAIN"]) ? $context["LOGIN_EXPLAIN"] : null);
            echo "</strong>
        </div>
    ";
        }
        // line 7
        echo " 
    ";
        // line 8
        if ((isset($context["LOGIN_ERROR"]) ? $context["LOGIN_ERROR"] : null)) {
            // line 9
            echo "         <div class=\"alert alert-danger fade in\">
           <i class=\"fa fa-warning\"></i><strong>&nbsp;";
            // line 10
            echo (isset($context["LOGIN_ERROR"]) ? $context["LOGIN_ERROR"] : null);
            echo "</strong>
         </div>
    ";
        }
        // line 13
        echo "\t
    <section class=\"panel-login panel-w-form login-full\">
            <div class=\"row\">
                ";
        // line 16
        if (((isset($context["S_REGISTER_ENABLED"]) ? $context["S_REGISTER_ENABLED"] : null) &&  !(isset($context["S_ADMIN_AUTH"]) ? $context["S_ADMIN_AUTH"] : null))) {
            // line 17
            echo "\t\t\t\t<div class=\"col-sm-6\">
\t\t\t\t<div class=\"signin-text\">
\t\t\t\t\t<span>";
            // line 19
            echo $this->env->getExtension('phpbb')->lang("CREATE_ACCOUNT");
            echo "</span>
\t\t\t\t</div>
                    <p>";
            // line 21
            echo $this->env->getExtension('phpbb')->lang("LOGIN_INFO");
            echo "</p>
\t\t\t\t    <p><a href=\"";
            // line 22
            echo (isset($context["U_TERMS_USE"]) ? $context["U_TERMS_USE"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("TERMS_USE");
            echo "</a>&nbsp;&#124;&nbsp;<a href=\"";
            echo (isset($context["U_PRIVACY"]) ? $context["U_PRIVACY"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("PRIVACY");
            echo "</a></p>
\t\t\t\t\t<p><a href=\"";
            // line 23
            echo (isset($context["U_REGISTER"]) ? $context["U_REGISTER"] : null);
            echo "\" class=\"btn btn-default btn-reg-login\">";
            echo $this->env->getExtension('phpbb')->lang("REGISTER");
            echo "</a></p>
                </div>
\t\t\t\t";
        } elseif (        // line 25
(isset($context["S_ADMIN_AUTH"]) ? $context["S_ADMIN_AUTH"] : null)) {
            // line 26
            echo "\t\t\t\t<div class=\"col-sm-6\">
\t\t\t\t<div class=\"signin-text\">
\t\t\t\t\t<span>";
            // line 28
            echo $this->env->getExtension('phpbb')->lang("ADMIN_TIPS");
            echo "</span>
\t\t\t\t</div>
\t\t\t\t    <p>";
            // line 30
            echo $this->env->getExtension('phpbb')->lang("ADMIN_TIP_INTRO");
            echo "</p>
                    <ul>
\t\t\t\t\t<li>";
            // line 32
            echo $this->env->getExtension('phpbb')->lang("ADMIN_TIP_ONE");
            echo "</li>
\t\t\t\t    <li>";
            // line 33
            echo $this->env->getExtension('phpbb')->lang("ADMIN_TIP_TWO");
            echo "</li>
\t\t\t\t\t<li>";
            // line 34
            echo $this->env->getExtension('phpbb')->lang("ADMIN_TIP_THREE");
            echo "</li>
\t\t\t\t\t</ul>
\t\t\t\t\t<p><a href=\"";
            // line 36
            echo (isset($context["U_SITESPLAT"]) ? $context["U_SITESPLAT"] : null);
            echo "\" class=\"btn btn-default\">";
            echo $this->env->getExtension('phpbb')->lang("ADMIN_CHECK_IT_BTN");
            echo "</a></p>
                </div>
\t\t\t\t";
        } else {
            // line 39
            echo "\t\t\t\t<div class=\"col-sm-6\">
\t\t\t\t<div class=\"signin-text\">
\t\t\t\t\t<span>";
            // line 41
            echo $this->env->getExtension('phpbb')->lang("CREATE_ACCOUNT_DISABLED");
            echo "</span>
\t\t\t\t</div>
                    <p>";
            // line 43
            echo $this->env->getExtension('phpbb')->lang("REGISTRATION_DISABLED");
            echo "</p>
\t\t\t\t    <p><a href=\"";
            // line 44
            echo (isset($context["U_TERMS_USE"]) ? $context["U_TERMS_USE"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("TERMS_USE");
            echo "</a>&nbsp;&#124;&nbsp;<a href=\"";
            echo (isset($context["U_PRIVACY"]) ? $context["U_PRIVACY"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("PRIVACY");
            echo "</a></p>
\t\t\t\t\t<p><a href=\"mailto:";
            // line 45
            echo (isset($context["BOARD_EMAIL"]) ? $context["BOARD_EMAIL"] : null);
            echo "?subject=Registrations Closed&body=Dear Admin, %0A%0AI Just wanted to let you know that the board registrations are closed. %0A%0AThis might be an error and I would like to register. %0A%0APlease let me know if this is possible.%0A%0AThanks!\" class=\"btn btn-default\">";
            echo $this->env->getExtension('phpbb')->lang("CONTACT_WEBMASTER");
            echo "</a></p>
                </div>
\t\t\t\t";
        }
        // line 48
        echo "\t\t\t\t<div class=\"col-sm-6\">
\t\t\t\t<div class=\"signin-text\">
\t\t\t\t\t<span>";
        // line 50
        echo $this->env->getExtension('phpbb')->lang("SIGN_IN_ACCOUNT");
        echo "</span>
\t\t\t\t</div>
\t\t\t\t <form role=\"form\" action=\"";
        // line 52
        echo (isset($context["S_LOGIN_ACTION"]) ? $context["S_LOGIN_ACTION"] : null);
        echo "\" method=\"post\" id=\"login\">
\t\t\t\t  <fieldset>
\t\t\t\t\t<div class=\"form-group\">
\t\t\t\t\t<label class=\"sr-only\" for=\"";
        // line 55
        echo (isset($context["USERNAME_CREDENTIAL"]) ? $context["USERNAME_CREDENTIAL"] : null);
        echo "\">";
        echo $this->env->getExtension('phpbb')->lang("USERNAME");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t\t\t\t\t<div class=\"form-icon\">
\t\t\t\t\t <input type=\"text\" class=\"form-control input-lg\" tabindex=\"1\" name=\"";
        // line 57
        echo (isset($context["USERNAME_CREDENTIAL"]) ? $context["USERNAME_CREDENTIAL"] : null);
        echo "\" id=\"";
        echo (isset($context["USERNAME_CREDENTIAL"]) ? $context["USERNAME_CREDENTIAL"] : null);
        echo "\" value=\"";
        echo (isset($context["USERNAME"]) ? $context["USERNAME"] : null);
        echo "\" placeholder=\"";
        echo $this->env->getExtension('phpbb')->lang("USERNAME");
        echo "\">
\t\t\t\t\t <span class=\"fa fa-user login-form-icon\"></span>
\t\t\t\t\t</div> 
\t\t\t\t    </div> 
\t\t\t\t\t<div class=\"form-group\">
\t\t\t\t\t <label class=\"sr-only\" for=\"";
        // line 62
        echo (isset($context["PASSWORD_CREDENTIAL"]) ? $context["PASSWORD_CREDENTIAL"] : null);
        echo "\">";
        echo $this->env->getExtension('phpbb')->lang("PASSWORD");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t\t\t\t\t  <div class=\"form-icon\">
\t\t\t\t\t\t<input type=\"password\" class=\"form-control input-lg\" tabindex=\"2\" id=\"";
        // line 64
        echo (isset($context["PASSWORD_CREDENTIAL"]) ? $context["PASSWORD_CREDENTIAL"] : null);
        echo "\" name=\"";
        echo (isset($context["PASSWORD_CREDENTIAL"]) ? $context["PASSWORD_CREDENTIAL"] : null);
        echo "\" placeholder=\"";
        echo $this->env->getExtension('phpbb')->lang("PASSWORD");
        echo "\" autocomplete=\"off\">
\t\t\t\t\t\t<span class=\"fa fa-lock login-form-icon\"></span>
\t\t\t\t\t  </div> 
\t\t\t\t\t</div>
\t\t\t\t<p>
\t\t\t\t ";
        // line 69
        if ((isset($context["S_DISPLAY_FULL_LOGIN"]) ? $context["S_DISPLAY_FULL_LOGIN"] : null)) {
            // line 70
            echo "\t\t\t\t\t";
            if ((isset($context["S_AUTOLOGIN_ENABLED"]) ? $context["S_AUTOLOGIN_ENABLED"] : null)) {
                // line 71
                echo "\t\t\t\t\t<div class=\"checkbox pull-right\">                                              
\t\t\t\t\t <label for=\"autologin\"><input type=\"checkbox\" name=\"autologin\" id=\"autologin\" tabindex=\"4\">";
                // line 72
                echo $this->env->getExtension('phpbb')->lang("LOGIN_REMEMBER");
                echo "</label>
\t\t\t\t\t <label for=\"viewonline\"><input type=\"checkbox\" name=\"viewonline\" id=\"viewonline\" tabindex=\"5\">";
                // line 73
                echo $this->env->getExtension('phpbb')->lang("LOGIN_HIDE_ME");
                echo "</label>
\t\t\t\t\t</div>
\t\t\t\t\t";
            }
            // line 76
            echo "\t\t\t\t";
        }
        // line 77
        echo "\t\t\t\t\t<button type=\"submit\" class=\"btn btn btn-primary\" tabindex=\"6\" name=\"login\" value=\"";
        echo $this->env->getExtension('phpbb')->lang("LOGIN");
        echo "\" data-loading-text=\"";
        echo $this->env->getExtension('phpbb')->lang("LOADING_LOG_IN");
        echo " <i class='fa-spin fa fa-spinner fa-lg'></i>\">";
        echo $this->env->getExtension('phpbb')->lang("LOGIN_ME_IN");
        echo "</button>
\t\t\t\t</p>
\t\t\t\t  ";
        // line 79
        if (((isset($context["S_DISPLAY_FULL_LOGIN"]) ? $context["S_DISPLAY_FULL_LOGIN"] : null) && ((isset($context["U_SEND_PASSWORD"]) ? $context["U_SEND_PASSWORD"] : null) || (isset($context["U_RESEND_ACTIVATION"]) ? $context["U_RESEND_ACTIVATION"] : null)))) {
            // line 80
            echo "\t\t\t\t\t\t";
            if ((isset($context["U_SEND_PASSWORD"]) ? $context["U_SEND_PASSWORD"] : null)) {
                echo "<a href=\"";
                echo (isset($context["U_SEND_PASSWORD"]) ? $context["U_SEND_PASSWORD"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("FORGOT_PASS");
                echo "</a>";
            }
            // line 81
            echo "\t\t\t\t\t\t";
            if ((isset($context["U_RESEND_ACTIVATION"]) ? $context["U_RESEND_ACTIVATION"] : null)) {
                echo "&nbsp;&#124;&nbsp;<a href=\"";
                echo (isset($context["U_RESEND_ACTIVATION"]) ? $context["U_RESEND_ACTIVATION"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("RESEND_ACTIVATION");
                echo "</a>";
            }
            // line 82
            echo "\t\t\t\t";
        }
        // line 83
        echo "\t\t\t\t  
\t\t\t\t   ";
        // line 84
        if (((isset($context["CAPTCHA_TEMPLATE"]) ? $context["CAPTCHA_TEMPLATE"] : null) && (isset($context["S_CONFIRM_CODE"]) ? $context["S_CONFIRM_CODE"] : null))) {
            // line 85
            echo "\t\t\t\t\t\t<div class=\"space10\"></div>
\t\t\t\t\t\t";
            // line 86
            $value = 3;
            $context['definition']->set('CAPTCHA_TAB_INDEX', $value);
            // line 87
            echo "\t\t\t\t\t\t";
            $location = (("" . (isset($context["CAPTCHA_TEMPLATE"]) ? $context["CAPTCHA_TEMPLATE"] : null)) . "");
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate((("" . (isset($context["CAPTCHA_TEMPLATE"]) ? $context["CAPTCHA_TEMPLATE"] : null)) . ""), "login_body.html", 87)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 88
            echo "\t\t\t\t\t";
        }
        // line 89
        echo "\t\t\t\t\t
\t\t\t\t  ";
        // line 90
        echo (isset($context["S_LOGIN_REDIRECT"]) ? $context["S_LOGIN_REDIRECT"] : null);
        echo "
\t\t\t\t\t";
        // line 91
        echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
        echo "
\t\t\t\t  </fieldset>
\t\t\t\t  </form>
\t\t\t\t  ";
        // line 94
        // line 95
        echo "\t\t\t\t";
        if (( !(isset($context["S_ADMIN_AUTH"]) ? $context["S_ADMIN_AUTH"] : null) && (isset($context["PROVIDER_TEMPLATE_FILE"]) ? $context["PROVIDER_TEMPLATE_FILE"] : null))) {
            // line 96
            echo "\t\t\t\t\t";
            $location = (("" . (isset($context["PROVIDER_TEMPLATE_FILE"]) ? $context["PROVIDER_TEMPLATE_FILE"] : null)) . "");
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate((("" . (isset($context["PROVIDER_TEMPLATE_FILE"]) ? $context["PROVIDER_TEMPLATE_FILE"] : null)) . ""), "login_body.html", 96)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 97
            echo "\t\t\t\t";
        }
        // line 98
        echo "\t\t\t    </div>  
            </div>
    </section>
\t
";
        // line 102
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "login_body.html", 102)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "login_body.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  339 => 102,  333 => 98,  330 => 97,  317 => 96,  314 => 95,  313 => 94,  307 => 91,  303 => 90,  300 => 89,  297 => 88,  284 => 87,  281 => 86,  278 => 85,  276 => 84,  273 => 83,  270 => 82,  261 => 81,  252 => 80,  250 => 79,  240 => 77,  237 => 76,  231 => 73,  227 => 72,  224 => 71,  221 => 70,  219 => 69,  207 => 64,  199 => 62,  185 => 57,  177 => 55,  171 => 52,  166 => 50,  162 => 48,  154 => 45,  144 => 44,  140 => 43,  135 => 41,  131 => 39,  123 => 36,  118 => 34,  114 => 33,  110 => 32,  105 => 30,  100 => 28,  96 => 26,  94 => 25,  87 => 23,  77 => 22,  73 => 21,  68 => 19,  64 => 17,  62 => 16,  57 => 13,  51 => 10,  48 => 9,  46 => 8,  43 => 7,  37 => 4,  34 => 3,  31 => 2,  19 => 1,);
    }
}
