<?php

/* captcha_default.html */
class __TwigTemplate_b5396f68e2b76e2ea6a0c3d35b13f894782146e5837a9b4bdbb3672a74ddbbbb extends Twig_Template
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
        if (((isset($context["S_TYPE"]) ? $context["S_TYPE"] : null) == 1)) {
            // line 2
            echo "\t<div class=\"side-segment\"><h3>";
            echo $this->env->getExtension('phpbb')->lang("CONFIRMATION");
            echo "</h3></div>
<div class=\"well\">
\t<p>";
            // line 4
            echo $this->env->getExtension('phpbb')->lang("CONFIRM_EXPLAIN");
            echo "</p>
\t<fieldset>
";
        }
        // line 7
        echo "<label class=\"control-label\" for=\"confirm_code\">";
        echo $this->env->getExtension('phpbb')->lang("CONFIRM_CODE");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("CONFIRM_CODE_EXPLAIN");
        echo "</span>
<img src=\"";
        // line 8
        echo (isset($context["CONFIRM_IMAGE_LINK"]) ? $context["CONFIRM_IMAGE_LINK"] : null);
        echo "\" alt=\"";
        echo $this->env->getExtension('phpbb')->lang("CONFIRM_CODE");
        echo "\" />
<div class=\"space10\"></div>
<div class=\"";
        // line 10
        if ((isset($context["S_CONFIRM_REFRESH"]) ? $context["S_CONFIRM_REFRESH"] : null)) {
            echo "input-group";
        } else {
            echo "nothing";
        }
        echo "\">
     <input class=\"form-control\" type=\"text\" name=\"confirm_code\" id=\"confirm_code\" maxlength=\"8\" tabindex=\"";
        // line 11
        echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "CAPTCHA_TAB_INDEX", array());
        echo "\" title=\"";
        echo $this->env->getExtension('phpbb')->lang("CONFIRM_CODE");
        echo "\" placeholder=\"Ex:1GHn387U\">
\t";
        // line 12
        if ((isset($context["S_CONFIRM_REFRESH"]) ? $context["S_CONFIRM_REFRESH"] : null)) {
            // line 13
            echo "    <div class=\"input-group-btn\">
\t <button type=\"submit\" name=\"refresh_vc\" id=\"refresh_vc\" class=\"btn btn-default\" value=\"";
            // line 14
            echo $this->env->getExtension('phpbb')->lang("VC_REFRESH");
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("VC_REFRESH");
            echo "\" ><i class=\"fa fa-retweet\"></i></button>
    </div>
\t";
        }
        // line 17
        echo "</div>
<input type=\"hidden\" name=\"confirm_id\" id=\"confirm_id\" value=\"";
        // line 18
        echo (isset($context["CONFIRM_ID"]) ? $context["CONFIRM_ID"] : null);
        echo "\" />
";
        // line 19
        if (((isset($context["S_TYPE"]) ? $context["S_TYPE"] : null) == 1)) {
            // line 20
            echo "\t</fieldset>
</div>
";
        }
    }

    public function getTemplateName()
    {
        return "captcha_default.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  84 => 20,  82 => 19,  78 => 18,  75 => 17,  67 => 14,  64 => 13,  62 => 12,  56 => 11,  48 => 10,  41 => 8,  33 => 7,  27 => 4,  21 => 2,  19 => 1,);
    }
}
