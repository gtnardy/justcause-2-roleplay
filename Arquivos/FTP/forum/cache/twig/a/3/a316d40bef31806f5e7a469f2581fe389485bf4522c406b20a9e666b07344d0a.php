<?php

/* ucp_register.html */
class __TwigTemplate_a316d40bef31806f5e7a469f2581fe389485bf4522c406b20a9e666b07344d0a extends Twig_Template
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
        $this->loadTemplate("overall_header.html", "ucp_register.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "<script>
/* Change language */
\tfunction change_language(lang_iso)
\t{
\t\tdocument.cookie = '";
        // line 6
        echo (isset($context["COOKIE_NAME"]) ? $context["COOKIE_NAME"] : null);
        echo "_lang=' + lang_iso + '; path=";
        echo (isset($context["COOKIE_PATH"]) ? $context["COOKIE_PATH"] : null);
        echo "';
\t\tdocument.forms['register'].change_lang.value = lang_iso;
\t\tdocument.forms['register'].submit.click();
\t}
</script>
";
        // line 11
        // line 12
        echo "<div class=\"side-segment\"><h3>";
        echo (isset($context["SITENAME"]) ? $context["SITENAME"] : null);
        echo "&nbsp;&#45;&nbsp;";
        echo $this->env->getExtension('phpbb')->lang("REGISTRATION");
        echo "</h3></div>
<form role=\"form\" method=\"post\" action=\"";
        // line 13
        echo (isset($context["S_UCP_ACTION"]) ? $context["S_UCP_ACTION"] : null);
        echo "\" id=\"register\">
<fieldset>
<div class=\"well panel-w-form\">
\t";
        // line 16
        if ((isset($context["ERROR"]) ? $context["ERROR"] : null)) {
            // line 17
            echo "\t <div class=\"alert alert-info\">";
            echo (isset($context["ERROR"]) ? $context["ERROR"] : null);
            echo "</div>
\t";
        }
        // line 19
        echo "\t
\t";
        // line 20
        if ((isset($context["L_REG_COND"]) ? $context["L_REG_COND"] : null)) {
            // line 21
            echo "\t <p>";
            echo $this->env->getExtension('phpbb')->lang("REG_COND");
            echo "</p>
\t";
        }
        // line 23
        echo "    
<div class=\"row\">
";
        // line 25
        // line 26
        echo "   <div class=\"col-md-6\">
\t<div class=\"form-group\">
\t\t<label for=\"username\" class=\"control-label\">";
        // line 28
        echo $this->env->getExtension('phpbb')->lang("USERNAME");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("USERNAME_EXPLAIN");
        echo "</span>
\t\t<div class=\"form-icon\">
\t\t\t<input class=\"form-control input-lg\" type=\"text\" name=\"username\" id=\"username\" size=\"25\" value=\"";
        // line 30
        echo (isset($context["USERNAME"]) ? $context["USERNAME"] : null);
        echo "\" title=\"";
        echo $this->env->getExtension('phpbb')->lang("USERNAME");
        echo "\" placeholder=\"E.g,John Doe\"/>
\t\t    <span class=\"fa fa-user login-form-icon\"></span>
\t\t </div> 
\t\t<div class=\"control-group\"></div>
\t</div>
   </div>
 
   <div class=\"col-md-6\">
\t<div class=\"form-group\">
\t\t<label class=\"control-label\" for=\"email\">";
        // line 39
        echo $this->env->getExtension('phpbb')->lang("EMAIL_ADDRESS");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("UCP_REGISTER_EMAIL_EXPLAIN");
        echo "</span>
          <div class=\"form-icon\">
\t\t    <input class=\"form-control input-lg\" type=\"text\" name=\"email\" id=\"email\" size=\"25\" maxlength=\"100\" value=\"";
        // line 41
        echo (isset($context["EMAIL"]) ? $context["EMAIL"] : null);
        echo "\" placeholder=\"E.g.,john@mail.com\" autocomplete=\"off\"/>
\t\t    <span class=\"icon-moon-email login-form-icon\"></span>
\t\t  </div>
\t\t  <div class=\"control-group\"></div>
\t</div> 
   </div> 

   <div class=\"col-md-6\">
\t<div class=\"form-group\">
\t\t<label class=\"control-label\" for=\"new_password\">";
        // line 50
        echo $this->env->getExtension('phpbb')->lang("PASSWORD");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("PASSWORD_EXPLAIN");
        echo "</span>
          <div class=\"form-icon\">
\t\t    <input class=\"form-control input-lg\" type=\"password\" name=\"new_password\" id=\"new_password\" size=\"25\" value=\"";
        // line 52
        echo (isset($context["PASSWORD"]) ? $context["PASSWORD"] : null);
        echo "\" placeholder=\"Ex:ASDFasdf123\" autocomplete=\"off\"/>
\t\t  <span class=\"fa fa-key login-form-icon\"></span>
\t\t  </div>
\t\t  <div class=\"control-group\"></div>
\t</div> 
   </div>
   
   <div class=\"col-md-6\">
\t<div class=\"form-group\">
\t\t<label class=\"control-label\" for=\"password_confirm\">";
        // line 61
        echo $this->env->getExtension('phpbb')->lang("CONFIRM_PASSWORD");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("PASSWORD_EXPLAIN_CONFIRM");
        echo "</span>
          <div class=\"form-icon\">
\t\t    <input class=\"form-control input-lg\" type=\"password\" name=\"password_confirm\" id=\"password_confirm\" size=\"25\" value=\"";
        // line 63
        echo (isset($context["PASSWORD_CONFIRM"]) ? $context["PASSWORD_CONFIRM"] : null);
        echo "\" placeholder=\"Ex:ASDFasdf123\" autocomplete=\"off\"/>
\t\t   <span class=\"fa fa-key login-form-icon\"></span>
\t\t  </div>
\t\t  <div class=\"control-group\"></div>
\t</div> 
   </div>
   ";
        // line 69
        // line 70
        echo "</div>


<div class=\"row\">
\t<div class=\"col-md-6\">
\t<div class=\"form-group\"> 
\t<div class=\"control-group\">
\t   <label class=\"control-label\" for=\"lang\">";
        // line 77
        echo $this->env->getExtension('phpbb')->lang("LANGUAGE");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
       <div>
\t    <select class=\"selectpicker\" data-container=\"body\" name=\"lang\" id=\"lang\" onchange=\"change_language(this.value); return false;\" tabindex=\"6\" title=\"";
        // line 79
        echo $this->env->getExtension('phpbb')->lang("LANGUAGE");
        echo "\">";
        echo (isset($context["S_LANG_OPTIONS"]) ? $context["S_LANG_OPTIONS"] : null);
        echo "</select>
\t</div> 
\t</div>
\t</div>
  </div>

   <div class=\"col-md-6\">
    <!-- /* from timezone_option.html */ -->\t
\t<div class=\"control-group\"> 
\t\t<label class=\"control-label\" for=\"timezone\">";
        // line 88
        echo $this->env->getExtension('phpbb')->lang("BOARD_TIMEZONE");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t\t<div class=\"controls controls-row\"> 
\t\t<select class=\"tz_select selectpicker\" data-container=\"body\" data-width=\"auto\" name=\"tz\" id=\"timezone\">
\t\t\t<option value=\"\">";
        // line 91
        echo $this->env->getExtension('phpbb')->lang("SELECT_TIMEZONE");
        echo "</option>
\t\t";
        // line 92
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "timezone_select", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["timezone_select"]) {
            // line 93
            echo "\t\t\t<optgroup label=\"";
            echo $this->getAttribute($context["timezone_select"], "LABEL", array());
            echo "\" data-tz-value=\"";
            echo $this->getAttribute($context["timezone_select"], "VALUE", array());
            echo "\">
\t\t\t\t";
            // line 94
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["timezone_select"], "timezone_options", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["timezone_options"]) {
                // line 95
                echo "\t\t\t\t<option title=\"";
                echo $this->getAttribute($context["timezone_options"], "TITLE", array());
                echo "\" value=\"";
                echo $this->getAttribute($context["timezone_options"], "VALUE", array());
                echo "\"";
                if ($this->getAttribute($context["timezone_options"], "SELECTED", array())) {
                    echo " selected=\"selected\"";
                }
                echo ">";
                echo $this->getAttribute($context["timezone_options"], "LABEL", array());
                echo "</option>
\t\t\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['timezone_options'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 97
            echo "\t\t\t</optgroup>
\t\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['timezone_select'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 99
        echo "\t\t</select>
\t\t</div>
\t</div>
\t<!-- /* from timezone_option.html */ -->
   </div>
  
</div>
\t
\t
";
        // line 108
        // line 109
        echo "\t";
        if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "profile_fields", array()))) {
            // line 110
            echo "\t\t<strong>";
            echo $this->env->getExtension('phpbb')->lang("ITEMS_REQUIRED");
            echo "</strong>
\t";
            // line 111
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "profile_fields", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["profile_fields"]) {
                // line 112
                echo "\t<div class=\"control-group\"> 
\t  ";
                // line 113
                if ($this->getAttribute($context["profile_fields"], "ERROR", array())) {
                    echo "<span class=\"error\">";
                    echo $this->getAttribute($context["profile_fields"], "ERROR", array());
                    echo "</span>";
                }
                // line 114
                echo "\t\t<label class=\"control-label\"";
                if ($this->getAttribute($context["profile_fields"], "FIELD_ID", array())) {
                    echo " for=\"";
                    echo $this->getAttribute($context["profile_fields"], "FIELD_ID", array());
                    echo "\"";
                }
                echo ">";
                echo $this->getAttribute($context["profile_fields"], "LANG_NAME", array());
                echo $this->env->getExtension('phpbb')->lang("COLON");
                if ($this->getAttribute($context["profile_fields"], "S_REQUIRED", array())) {
                    echo "&nbsp;&#42;";
                }
                echo "</label>";
                if ($this->getAttribute($context["profile_fields"], "LANG_EXPLAIN", array())) {
                    echo "<span class=\"help-block\">";
                    echo $this->getAttribute($context["profile_fields"], "LANG_EXPLAIN", array());
                    echo "</span>";
                }
                // line 115
                echo "\t\t  ";
                echo $this->getAttribute($context["profile_fields"], "FIELD", array());
                echo "
\t</div> \t
\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['profile_fields'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 118
            echo "\t";
        }
        // line 119
        echo "\t
";
        // line 120
        echo "  \t
</div>
</fieldset>


";
        // line 125
        if ((isset($context["CAPTCHA_TEMPLATE"]) ? $context["CAPTCHA_TEMPLATE"] : null)) {
            // line 126
            echo "\t";
            $value = 8;
            $context['definition']->set('CAPTCHA_TAB_INDEX', $value);
            // line 127
            echo "\t";
            $location = (("" . (isset($context["CAPTCHA_TEMPLATE"]) ? $context["CAPTCHA_TEMPLATE"] : null)) . "");
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate((("" . (isset($context["CAPTCHA_TEMPLATE"]) ? $context["CAPTCHA_TEMPLATE"] : null)) . ""), "ucp_register.html", 127)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        }
        // line 129
        echo "
";
        // line 130
        if ((isset($context["S_COPPA"]) ? $context["S_COPPA"] : null)) {
            // line 131
            echo "\t<div class=\"alert alert-info fade in\">
\t\t<button class=\"close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t\t<strong>";
            // line 133
            echo $this->env->getExtension('phpbb')->lang("COPPA_COMPLIANCE");
            echo "</strong> <br>";
            echo $this->env->getExtension('phpbb')->lang("COPPA_EXPLAIN");
            echo "
\t</div>
";
        }
        // line 136
        echo "
\t<fieldset class=\"form-actions\">
\t\t";
        // line 138
        echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
        echo "
\t\t<button type=\"reset\" value=\"";
        // line 139
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "\" name=\"reset\" class=\"btn btn-default\">";
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "</button>
\t\t<button type=\"submit\" class=\"btn btn-default\" tabindex=\"9\" name=\"submit\" id=\"submit\" value=\"";
        // line 140
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "\" autocomplete=\"off\" data-loading-text=\"";
        echo $this->env->getExtension('phpbb')->lang("REG_CREATING");
        echo " <i class='fa fa-spin fa-spinner fa-lg icon-white'></i>\">";
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "</button>
\t\t";
        // line 141
        echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
        echo "
\t</fieldset>

</form>

";
        // line 146
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "ucp_register.html", 146)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "ucp_register.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  390 => 146,  382 => 141,  374 => 140,  368 => 139,  364 => 138,  360 => 136,  352 => 133,  348 => 131,  346 => 130,  343 => 129,  329 => 127,  325 => 126,  323 => 125,  316 => 120,  313 => 119,  310 => 118,  300 => 115,  281 => 114,  275 => 113,  272 => 112,  268 => 111,  263 => 110,  260 => 109,  259 => 108,  248 => 99,  241 => 97,  224 => 95,  220 => 94,  213 => 93,  209 => 92,  205 => 91,  198 => 88,  184 => 79,  178 => 77,  169 => 70,  168 => 69,  159 => 63,  151 => 61,  139 => 52,  131 => 50,  119 => 41,  111 => 39,  97 => 30,  89 => 28,  85 => 26,  84 => 25,  80 => 23,  74 => 21,  72 => 20,  69 => 19,  63 => 17,  61 => 16,  55 => 13,  48 => 12,  47 => 11,  37 => 6,  31 => 2,  19 => 1,);
    }
}
