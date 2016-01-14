<?php

/* @sitesplat_BBCore/event/acp_styles_before_table.html */
class __TwigTemplate_b6a0d001c48e73ab998053b7a2140e6191537fca4b37f2c0d7e41722fda61515 extends Twig_Template
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
        echo "<table cellspacing=\"1\">
\t<thead>
\t<tr>
\t <th colspan=\"2\">";
        // line 4
        echo $this->env->getExtension('phpbb')->lang("ACP_SITESPLAT_UPDATE_MANAGER");
        echo "</th>
\t</tr>
\t</thead>
\t<tbody>
\t";
        // line 8
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "sitesplat_themes", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["sitesplat_themes"]) {
            // line 9
            echo "\t\t\t<tr style=\"font-size: 14px;\">
\t\t\t\t<td style=\"text-align:center;\" class=\"row2\">
\t        <strong>";
            // line 11
            echo $this->getAttribute($context["sitesplat_themes"], "NAME", array());
            echo "</strong>
\t\t\t\t</td>
\t\t\t\t<td class=\"row1\">
\t\t\t\t\t";
            // line 14
            echo $this->env->getExtension('phpbb')->lang("ACP_SITESPLAT_V_INSTALLED");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "<strong>&nbsp;";
            echo $this->getAttribute($context["sitesplat_themes"], "VERSION", array());
            echo "</strong><br />
\t\t\t\t";
            // line 15
            if ($this->getAttribute($context["sitesplat_themes"], "MSG", array())) {
                // line 16
                echo "\t\t\t\t\t<br />";
                echo $this->getAttribute($context["sitesplat_themes"], "MSG", array());
                echo "
\t\t\t\t";
            }
            // line 18
            echo "\t\t\t\t</td>
\t\t\t</tr>
\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['sitesplat_themes'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 21
        echo "\t</tbody>
</table>
<br />";
    }

    public function getTemplateName()
    {
        return "@sitesplat_BBCore/event/acp_styles_before_table.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  68 => 21,  60 => 18,  54 => 16,  52 => 15,  45 => 14,  39 => 11,  35 => 9,  31 => 8,  24 => 4,  19 => 1,);
    }
}
