<?php

/* jump_links.html */
class __TwigTemplate_aa804ee9a75c11c00acca66dc06457e2b1e54ffa922d6e89e0bd9d40321787c2 extends Twig_Template
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
        if ((isset($context["S_VIEWTOPIC"]) ? $context["S_VIEWTOPIC"] : null)) {
            // line 2
            echo "<div class=\"space10\"></div>
<div class=\"pull-left\">
\t<a href=\"";
            // line 4
            echo (isset($context["U_VIEW_FORUM"]) ? $context["U_VIEW_FORUM"] : null);
            echo "\" accesskey=\"r\"><i class=\"fa fa-chevron-left\"></i>&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("RETURN_TO_FORUM");
            echo "</a>
</div>
<div class=\"space10\"></div>
";
        } elseif (        // line 7
(isset($context["S_VIEWFORUM"]) ? $context["S_VIEWFORUM"] : null)) {
            // line 8
            echo "<div class=\"space10\"></div>
<div class=\"pull-left\">
\t<a href=\"";
            // line 10
            echo (isset($context["U_INDEX"]) ? $context["U_INDEX"] : null);
            echo "\" accesskey=\"r\"><i class=\"fa fa-chevron-left\"></i>&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("RETURN_TO_INDEX");
            echo "</a>
</div>
<div class=\"space10\"></div>
";
        } elseif (        // line 13
(isset($context["SEARCH_TOPIC"]) ? $context["SEARCH_TOPIC"] : null)) {
            // line 14
            echo "<div class=\"space10\"></div>
<div class=\"pull-left\">
\t<a href=\"";
            // line 16
            echo (isset($context["U_SEARCH_TOPIC"]) ? $context["U_SEARCH_TOPIC"] : null);
            echo "\" accesskey=\"r\"><i class=\"fa fa-chevron-left\"></i>&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("RETURN_TO_TOPIC");
            echo "</a>
</div>
<div class=\"space10\"></div>
";
        } elseif (        // line 19
(isset($context["S_SEARCH_ACTION"]) ? $context["S_SEARCH_ACTION"] : null)) {
            // line 20
            echo "<div class=\"space10\"></div>
<div class=\"pull-left\">
\t<a href=\"";
            // line 22
            echo (isset($context["U_SEARCH"]) ? $context["U_SEARCH"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("SEARCH_ADV");
            echo "\" accesskey=\"r\"><i class=\"fa fa-chevron-left\"></i>&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("GO_TO_SEARCH_ADV");
            echo "</a>
</div>
<div class=\"space10\"></div>
";
        }
    }

    public function getTemplateName()
    {
        return "jump_links.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  67 => 22,  63 => 20,  61 => 19,  53 => 16,  49 => 14,  47 => 13,  39 => 10,  35 => 8,  33 => 7,  25 => 4,  21 => 2,  19 => 1,);
    }
}
