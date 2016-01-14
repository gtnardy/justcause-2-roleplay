<?php

/* mcp_header.html */
class __TwigTemplate_41177d91c627771fddc95d87ab12ab99b1063af7d597458f42034fa12f19e00b extends Twig_Template
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
        $this->loadTemplate("overall_header.html", "mcp_header.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "<h2>";
        echo $this->env->getExtension('phpbb')->lang("MCP");
        echo "</h2>
";
        // line 3
        if ((isset($context["U_MCP"]) ? $context["U_MCP"] : null)) {
            // line 4
            echo "\t<p>
\t\t&#91;&nbsp;<a href=\"";
            // line 5
            echo (isset($context["U_MCP"]) ? $context["U_MCP"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("MCP");
            echo "</a>";
            if ((isset($context["U_MCP_FORUM"]) ? $context["U_MCP_FORUM"] : null)) {
                echo "&nbsp;&#124;&nbsp;<a href=\"";
                echo (isset($context["U_MCP_FORUM"]) ? $context["U_MCP_FORUM"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("MODERATE_FORUM");
                echo "</a>";
            }
            // line 6
            echo "\t\t";
            if ((isset($context["U_MCP_TOPIC"]) ? $context["U_MCP_TOPIC"] : null)) {
                echo "&nbsp;&#124;&nbsp;<a href=\"";
                echo (isset($context["U_MCP_TOPIC"]) ? $context["U_MCP_TOPIC"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("MODERATE_TOPIC");
                echo "</a>";
            }
            // line 7
            echo "\t\t";
            if ((isset($context["U_MCP_POST"]) ? $context["U_MCP_POST"] : null)) {
                echo "&nbsp;&#124;&nbsp;<a href=\"";
                echo (isset($context["U_MCP_POST"]) ? $context["U_MCP_POST"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("MODERATE_POST");
                echo "</a>";
            }
            echo "&nbsp;&#93;
\t</p>
";
        }
        // line 10
        echo "<div class=\"panel has-nav-tabs no-border\">
\t<ul class=\"nav nav-tabs\">
\t\t";
        // line 12
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "l_block1", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["l_block1"]) {
            // line 13
            echo "\t\t<li";
            if ($this->getAttribute($context["l_block1"], "S_SELECTED", array())) {
                echo " class=\"active\"";
            }
            echo "><a href=\"";
            echo $this->getAttribute($context["l_block1"], "U_TITLE", array());
            echo "\">";
            echo $this->getAttribute($context["l_block1"], "L_TITLE", array());
            echo "</a></li>
\t\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['l_block1'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 15
        echo "\t</ul>

<div class=\"panel-content\">
 <div class=\"panel-body\">
  <div class=\"row\">
  
  <!-- col-md-12 ends in mcp_footer
   <div class=\"col-md-12\">
   -->
  
    <div class=\"col-md-3\">
\t\t<div class=\"list-group\">
\t\t\t";
        // line 27
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "l_block1", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["l_block1"]) {
            // line 28
            echo "\t\t\t";
            if ($this->getAttribute($context["l_block1"], "S_SELECTED", array())) {
                // line 29
                echo "\t\t\t\t";
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["l_block1"], "l_block2", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["l_block2"]) {
                    // line 30
                    echo "\t\t\t\t";
                    if ($this->getAttribute($context["l_block2"], "S_SELECTED", array())) {
                        // line 31
                        echo "\t\t\t\t <a class=\"list-group-item active\" href=\"";
                        echo $this->getAttribute($context["l_block2"], "U_TITLE", array());
                        echo "\">";
                        echo $this->getAttribute($context["l_block2"], "L_TITLE", array());
                        if ($this->getAttribute($context["l_block2"], "ADD_ITEM", array())) {
                            echo " (";
                            echo $this->getAttribute($context["l_block2"], "ADD_ITEM", array());
                            echo ")";
                        }
                        echo "</a>
\t\t\t\t";
                    } else {
                        // line 33
                        echo "\t\t\t\t <a class=\"list-group-item\" href=\"";
                        echo $this->getAttribute($context["l_block2"], "U_TITLE", array());
                        echo "\">";
                        echo $this->getAttribute($context["l_block2"], "L_TITLE", array());
                        if ($this->getAttribute($context["l_block2"], "ADD_ITEM", array())) {
                            echo " (";
                            echo $this->getAttribute($context["l_block2"], "ADD_ITEM", array());
                            echo ")";
                        }
                        echo "</a>
\t\t\t\t";
                    }
                    // line 35
                    echo "\t\t\t\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['l_block2'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 36
                echo "\t\t\t";
            }
            // line 37
            echo "\t\t\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['l_block1'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 38
        echo "\t\t</div>
\t</div>

   <div class=\"col-md-9\">
\t<div class=\"tab-content\">
\t\t";
        // line 43
        if ((isset($context["MESSAGE"]) ? $context["MESSAGE"] : null)) {
            // line 44
            echo "\t\t<div class=\"content\">
\t\t\t<h2>";
            // line 45
            echo $this->env->getExtension('phpbb')->lang("MESSAGE");
            echo "</h2>
\t\t\t<p class=\"error\">";
            // line 46
            echo (isset($context["MESSAGE"]) ? $context["MESSAGE"] : null);
            echo "</p>
\t\t\t<p>";
            // line 47
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "return_links", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["return_links"]) {
                echo $this->getAttribute($context["return_links"], "MESSAGE_LINK", array());
                echo "<br /><br />";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['return_links'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            echo "</p>
\t\t</div>
\t\t";
        }
        // line 50
        echo "\t\t
\t";
        // line 51
        if ((isset($context["CONFIRM_MESSAGE"]) ? $context["CONFIRM_MESSAGE"] : null)) {
            // line 52
            echo "\t\t<form id=\"confirm\" method=\"post\" action=\"";
            echo (isset($context["S_CONFIRM_ACTION"]) ? $context["S_CONFIRM_ACTION"] : null);
            echo "\"";
            echo (isset($context["S_FORM_ENCTYPE"]) ? $context["S_FORM_ENCTYPE"] : null);
            echo ">
\t\t\t<div class=\"well\">
\t\t\t\t<h2>";
            // line 54
            echo $this->env->getExtension('phpbb')->lang("PLEASE_CONFIRM");
            echo "</h2>
\t\t\t\t<p>";
            // line 55
            echo (isset($context["CONFIRM_MESSAGE"]) ? $context["CONFIRM_MESSAGE"] : null);
            echo "</p>
\t\t\t\t<fieldset>
\t\t\t\t\t";
            // line 57
            echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
            echo "
\t\t\t\t\t<button class=\"btn btn-default\" type=\"submit\" name=\"submit\" value=\"";
            // line 58
            echo $this->env->getExtension('phpbb')->lang("YES");
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("YES");
            echo "</button>
\t\t\t\t\t<button class=\"btn btn-default\" type=\"cancel\" value=\"";
            // line 59
            echo $this->env->getExtension('phpbb')->lang("NO");
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("NO");
            echo "</button>
\t\t\t\t</fieldset>
\t\t\t</div>
\t\t</form>
\t";
        }
    }

    public function getTemplateName()
    {
        return "mcp_header.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  234 => 59,  228 => 58,  224 => 57,  219 => 55,  215 => 54,  207 => 52,  205 => 51,  202 => 50,  188 => 47,  184 => 46,  180 => 45,  177 => 44,  175 => 43,  168 => 38,  162 => 37,  159 => 36,  153 => 35,  140 => 33,  127 => 31,  124 => 30,  119 => 29,  116 => 28,  112 => 27,  98 => 15,  83 => 13,  79 => 12,  75 => 10,  62 => 7,  53 => 6,  41 => 5,  38 => 4,  36 => 3,  31 => 2,  19 => 1,);
    }
}
