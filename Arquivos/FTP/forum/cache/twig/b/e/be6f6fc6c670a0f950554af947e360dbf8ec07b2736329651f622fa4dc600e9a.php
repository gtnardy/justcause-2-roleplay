<?php

/* ucp_prefs_personal.html */
class __TwigTemplate_be6f6fc6c670a0f950554af947e360dbf8ec07b2736329651f622fa4dc600e9a extends Twig_Template
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
        $location = "ucp_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("ucp_header.html", "ucp_prefs_personal.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "<form id=\"ucp\" method=\"post\" action=\"";
        echo (isset($context["S_UCP_ACTION"]) ? $context["S_UCP_ACTION"] : null);
        echo "\"";
        echo (isset($context["S_FORM_ENCTYPE"]) ? $context["S_FORM_ENCTYPE"] : null);
        echo ">
  <div class=\"tab-pane active\">
\t<fieldset class=\"framed-ucp\">
\t<legend>";
        // line 5
        echo $this->env->getExtension('phpbb')->lang("TITLE");
        echo "</legend>
\t";
        // line 6
        if ((isset($context["ERROR"]) ? $context["ERROR"] : null)) {
            // line 7
            echo "\t<div class=\"alert alert-info fade in\">
       <i class=\"fa fa-warning\"></i><strong>&nbsp;";
            // line 8
            echo $this->env->getExtension('phpbb')->lang("INFO_BOX");
            echo "</strong>&nbsp;";
            echo (isset($context["ERROR"]) ? $context["ERROR"] : null);
            echo "
    </div>
\t";
        }
        // line 11
        // line 12
        echo "
<!-- profile-settings starts here--> 
  <div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"viewemail0\">";
        // line 15
        echo $this->env->getExtension('phpbb')->lang("SHOW_EMAIL");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t<div class=\"controls controls-row\"> 
        <div class=\"radio\"><input type=\"radio\" name=\"viewemail\" id=\"viewemail1\" value=\"1\"";
        // line 17
        if ((isset($context["S_VIEW_EMAIL"]) ? $context["S_VIEW_EMAIL"] : null)) {
            echo " checked=\"checked\"";
        }
        echo " /><label for=\"viewemail1\">";
        echo $this->env->getExtension('phpbb')->lang("YES");
        echo "</label></div>   
        <div class=\"radio\"><input type=\"radio\" name=\"viewemail\" id=\"viewemail0\" value=\"0\"";
        // line 18
        if ( !(isset($context["S_VIEW_EMAIL"]) ? $context["S_VIEW_EMAIL"] : null)) {
            echo " checked=\"checked\"";
        }
        echo " /><label for=\"viewemail0\">";
        echo $this->env->getExtension('phpbb')->lang("NO");
        echo "</label></div>
\t</div> 
\t</div> 
\t
\t<div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"massemail1\">";
        // line 23
        echo $this->env->getExtension('phpbb')->lang("ADMIN_EMAIL");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t<div class=\"controls controls-row\"> 
        <div class=\"radio\"><input type=\"radio\" name=\"massemail\" id=\"massemail1\" value=\"1\"";
        // line 25
        if ((isset($context["S_MASS_EMAIL"]) ? $context["S_MASS_EMAIL"] : null)) {
            echo " checked=\"checked\"";
        }
        echo " /><label for=\"massemail1\">";
        echo $this->env->getExtension('phpbb')->lang("YES");
        echo "</label></div>   
        <div class=\"radio\"><input type=\"radio\" name=\"massemail\" id=\"massemail0\" value=\"0\"";
        // line 26
        if ( !(isset($context["S_MASS_EMAIL"]) ? $context["S_MASS_EMAIL"] : null)) {
            echo " checked=\"checked\"";
        }
        echo " /><label for=\"massemail0\">";
        echo $this->env->getExtension('phpbb')->lang("NO");
        echo "</label></div>
\t</div> 
\t</div> 
\t
\t<div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"allowpm1\">";
        // line 31
        echo $this->env->getExtension('phpbb')->lang("ALLOW_PM");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("ALLOW_PM_EXPLAIN");
        echo "</span>
\t<div class=\"controls controls-row\"> 
        <div class=\"radio\"><input type=\"radio\" name=\"allowpm\" id=\"allowpm1\" value=\"1\"";
        // line 33
        if ((isset($context["S_ALLOW_PM"]) ? $context["S_ALLOW_PM"] : null)) {
            echo " checked=\"checked\"";
        }
        echo " /><label for=\"allowpm1\">";
        echo $this->env->getExtension('phpbb')->lang("YES");
        echo "</label></div>   
        <div class=\"radio\"><input type=\"radio\" name=\"allowpm\" id=\"allowpm0\" value=\"0\"";
        // line 34
        if ( !(isset($context["S_ALLOW_PM"]) ? $context["S_ALLOW_PM"] : null)) {
            echo " checked=\"checked\"";
        }
        echo " /><label for=\"allowpm0\">";
        echo $this->env->getExtension('phpbb')->lang("NO");
        echo "</label></div>
\t</div> 
\t</div> 
\t
    ";
        // line 38
        if ((isset($context["S_CAN_HIDE_ONLINE"]) ? $context["S_CAN_HIDE_ONLINE"] : null)) {
            // line 39
            echo "\t<div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"hideonline0\">";
            // line 40
            echo $this->env->getExtension('phpbb')->lang("HIDE_ONLINE");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label><span class=\"help-block\">";
            echo $this->env->getExtension('phpbb')->lang("HIDE_ONLINE_EXPLAIN");
            echo "</span>
\t<div class=\"controls controls-row\"> 
        <div class=\"radio\"><input type=\"radio\" name=\"hideonline\" id=\"hideonline1\" value=\"1\"";
            // line 42
            if ((isset($context["S_HIDE_ONLINE"]) ? $context["S_HIDE_ONLINE"] : null)) {
                echo " checked=\"checked\"";
            }
            echo " /><label for=\"hideonline1\">";
            echo $this->env->getExtension('phpbb')->lang("YES");
            echo "</label></div>   
        <div class=\"radio\"><input type=\"radio\" name=\"hideonline\" id=\"hideonline0\" value=\"0\"";
            // line 43
            if ( !(isset($context["S_HIDE_ONLINE"]) ? $context["S_HIDE_ONLINE"] : null)) {
                echo " checked=\"checked\"";
            }
            echo " /><label for=\"hideonline0\">";
            echo $this->env->getExtension('phpbb')->lang("NO");
            echo "</label></div>
\t</div> 
\t</div> 
\t";
        }
        // line 47
        echo "\t
\t";
        // line 48
        if ((isset($context["S_SELECT_NOTIFY"]) ? $context["S_SELECT_NOTIFY"] : null)) {
            // line 49
            echo "\t<div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"notifymethod0\">";
            // line 50
            echo $this->env->getExtension('phpbb')->lang("NOTIFY_METHOD");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t<div class=\"controls controls-row\"> 
        <div class=\"radio\"><input type=\"radio\" name=\"notifymethod\" id=\"notifymethod0\" value=\"0\"";
            // line 52
            if ((isset($context["S_NOTIFY_EMAIL"]) ? $context["S_NOTIFY_EMAIL"] : null)) {
                echo " checked=\"checked\"";
            }
            echo " /><label for=\"notifymethod0\">";
            echo $this->env->getExtension('phpbb')->lang("NOTIFY_METHOD_EMAIL");
            echo "</label></div>   
        <div class=\"radio\"><input type=\"radio\" name=\"notifymethod\" id=\"notifymethod1\" value=\"1\"";
            // line 53
            if ((isset($context["S_NOTIFY_IM"]) ? $context["S_NOTIFY_IM"] : null)) {
                echo " checked=\"checked\"";
            }
            echo " /><label for=\"notifymethod1\">";
            echo $this->env->getExtension('phpbb')->lang("NOTIFY_METHOD_IM");
            echo "</label></div>
\t\t<div class=\"radio\"><input type=\"radio\" name=\"notifymethod\" id=\"notifymethod2\" value=\"2\"";
            // line 54
            if ((isset($context["S_NOTIFY_BOTH"]) ? $context["S_NOTIFY_BOTH"] : null)) {
                echo " checked=\"checked\"";
            }
            echo " /><label for=\"notifymethod3\">";
            echo $this->env->getExtension('phpbb')->lang("NOTIFY_METHOD_BOTH");
            echo "</label></div>
\t</div> 
\t</div>
    ";
        }
        // line 57
        echo "\t
\t
\t";
        // line 59
        if ((isset($context["S_MORE_LANGUAGES"]) ? $context["S_MORE_LANGUAGES"] : null)) {
            // line 60
            echo "\t<div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"lang\">";
            // line 61
            echo $this->env->getExtension('phpbb')->lang("BOARD_LANGUAGE");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t<div class=\"controls controls-row\"> 
         <div class=\"selector\"><select name=\"lang\" id=\"lang\" class=\"selectpicker\" data-container=\"body\">";
            // line 63
            echo (isset($context["S_LANG_OPTIONS"]) ? $context["S_LANG_OPTIONS"] : null);
            echo "</select></div>   
\t</div> 
\t</div>
\t";
        }
        // line 67
        echo "\t
\t";
        // line 68
        if (((isset($context["S_STYLE_OPTIONS"]) ? $context["S_STYLE_OPTIONS"] : null) && (isset($context["S_MORE_STYLES"]) ? $context["S_MORE_STYLES"] : null))) {
            // line 69
            echo "    <div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"user_style\">";
            // line 70
            echo $this->env->getExtension('phpbb')->lang("BOARD_STYLE");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t<div class=\"controls controls-row\"> 
         <div class=\"selector\"><select name=\"user_style\" id=\"user_style\" class=\"selectpicker\" data-container=\"body\">";
            // line 72
            echo (isset($context["S_STYLE_OPTIONS"]) ? $context["S_STYLE_OPTIONS"] : null);
            echo "</select></div>   
\t</div>  
\t</div>
\t";
        }
        // line 76
        echo "\t
<!-- /* from timezone_option.html */ -->\t
<div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"timezone\">";
        // line 79
        echo $this->env->getExtension('phpbb')->lang("BOARD_TIMEZONE");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t<div class=\"controls controls-row\"> 
\t<select class=\"tz_select selectpicker\" data-container=\"body\" name=\"tz\" id=\"timezone\">
\t\t<option value=\"\">";
        // line 82
        echo $this->env->getExtension('phpbb')->lang("SELECT_TIMEZONE");
        echo "</option>
\t";
        // line 83
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "timezone_select", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["timezone_select"]) {
            // line 84
            echo "\t\t<optgroup label=\"";
            echo $this->getAttribute($context["timezone_select"], "LABEL", array());
            echo "\" data-tz-value=\"";
            echo $this->getAttribute($context["timezone_select"], "VALUE", array());
            echo "\">
\t\t\t";
            // line 85
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["timezone_select"], "timezone_options", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["timezone_options"]) {
                // line 86
                echo "\t\t\t<option title=\"";
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
\t\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['timezone_options'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 88
            echo "\t\t</optgroup>
\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['timezone_select'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 90
        echo "\t</select>
\t</div>
</div>
<!-- /* from timezone_option.html */ -->
\t
\t<div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"dateformat\">";
        // line 96
        echo $this->env->getExtension('phpbb')->lang("BOARD_DATE_FORMAT");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("BOARD_DATE_FORMAT_EXPLAIN");
        echo "</span>
\t<div class=\"controls controls-row\"> 
         <div class=\"selector\"><select class=\"selectpicker\" data-container=\"body\" name=\"dateoptions\" id=\"dateoptions\" onchange=\"if(this.value=='custom'){phpbb.toggleDisplay('custom_date',1);}else{phpbb.toggleDisplay('custom_date',-1);} if (this.value == 'custom') { document.getElementById('dateformat').value = default_dateformat; } else { document.getElementById('dateformat').value = this.value; }\">";
        // line 98
        echo (isset($context["S_DATEFORMAT_OPTIONS"]) ? $context["S_DATEFORMAT_OPTIONS"] : null);
        echo "</select></div>   
\t</div> 
\t<div class=\"radio\" id=\"custom_date\" style=\"display:none;\"><input type=\"text\" name=\"dateformat\" id=\"dateformat\" value=\"";
        // line 100
        echo (isset($context["DATE_FORMAT"]) ? $context["DATE_FORMAT"] : null);
        echo "\" maxlength=\"30\" class=\"form-control\" style=\"margin-top: 3px;\" /></div>
\t</div>
<!-- profile-settings ends here-->
";
        // line 103
        // line 104
        echo "\t</fieldset>
\t</div>

\t<div class=\"space10\"></div>
\t<div class=\"form-actions\"> 
\t";
        // line 109
        echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
        echo "
\t<button type=\"reset\" value=\"";
        // line 110
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "\" name=\"reset\" class=\"btn btn-default\" >";
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "</button>
\t<button type=\"submit\" name=\"submit\" value=\"";
        // line 111
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "\" class=\"btn btn-default\" autocomplete=\"off\" data-loading-text=\"";
        echo $this->env->getExtension('phpbb')->lang("LOADING");
        echo "<i class='fa fa-spin fa fa-spinner fa-lg icon-white'></i>\">";
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "</button>
\t";
        // line 112
        echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
        echo "
\t</div>

</form>

<script>
head.ready(function () {
/* original ucp_prefs_personal.html */
\tvar date_format = '";
        // line 120
        echo (isset($context["A_DATE_FORMAT"]) ? $context["A_DATE_FORMAT"] : null);
        echo "';
\tvar default_dateformat = '";
        // line 121
        echo (isset($context["A_DEFAULT_DATEFORMAT"]) ? $context["A_DEFAULT_DATEFORMAT"] : null);
        echo "';

\tfunction customDates()
\t{
\t\tvar e = document.getElementById('dateoptions');

\t\te.selectedIndex = e.length - 1;

\t\t// Loop and match date_format in menu
\t\tfor (var i = 0; i < e.length; i++)
\t\t{
\t\t\tif (e.options[i].value == date_format)
\t\t\t{
\t\t\t\te.selectedIndex = i;
\t\t\t\tbreak;
\t\t\t}
\t\t}

\t\t// Show/hide custom field
\t\tif (e.selectedIndex == e.length - 1)
\t\t{
\t\t\tphpbb.toggleDisplay('custom_date',1);
\t\t}
\t\telse
\t\t{
\t\t\tphpbb.toggleDisplay('custom_date',-1);
\t\t}
\t}

\tcustomDates();
/* original ucp_prefs_personal.html */
});
</script>
";
        // line 154
        $location = "ucp_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("ucp_footer.html", "ucp_prefs_personal.html", 154)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "ucp_prefs_personal.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  417 => 154,  381 => 121,  377 => 120,  366 => 112,  358 => 111,  352 => 110,  348 => 109,  341 => 104,  340 => 103,  334 => 100,  329 => 98,  321 => 96,  313 => 90,  306 => 88,  289 => 86,  285 => 85,  278 => 84,  274 => 83,  270 => 82,  263 => 79,  258 => 76,  251 => 72,  245 => 70,  242 => 69,  240 => 68,  237 => 67,  230 => 63,  224 => 61,  221 => 60,  219 => 59,  215 => 57,  204 => 54,  196 => 53,  188 => 52,  182 => 50,  179 => 49,  177 => 48,  174 => 47,  163 => 43,  155 => 42,  147 => 40,  144 => 39,  142 => 38,  131 => 34,  123 => 33,  115 => 31,  103 => 26,  95 => 25,  89 => 23,  77 => 18,  69 => 17,  63 => 15,  58 => 12,  57 => 11,  49 => 8,  46 => 7,  44 => 6,  40 => 5,  31 => 2,  19 => 1,);
    }
}
