<?php

/* mcp_front.html */
class __TwigTemplate_f3ddd6ed393602024aab90b0c284934ef7af40f71538faa5b611c2cba8347efc extends Twig_Template
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
        $location = "mcp_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("mcp_header.html", "mcp_front.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "<div class=\"tab-pane active\">


";
        // line 5
        echo "  
";
        // line 6
        if ((isset($context["S_SHOW_UNAPPROVED"]) ? $context["S_SHOW_UNAPPROVED"] : null)) {
            // line 7
            echo "<form id=\"mcp_queue\" method=\"post\" action=\"";
            echo (isset($context["S_MCP_QUEUE_ACTION"]) ? $context["S_MCP_QUEUE_ACTION"] : null);
            echo "\">
\t<div class=\"side-segment\"><h3>";
            // line 8
            echo $this->env->getExtension('phpbb')->lang("LATEST_UNAPPROVED");
            echo "</h3></div>
\t\t
\t ";
            // line 10
            if ((isset($context["S_HAS_UNAPPROVED_POSTS"]) ? $context["S_HAS_UNAPPROVED_POSTS"] : null)) {
                echo "<p>";
                echo $this->env->getExtension('phpbb')->lang("UNAPPROVED_TOTAL");
                echo "</p>";
            }
            // line 11
            echo "
\t";
            // line 12
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "unapproved", array()))) {
                echo "\t
 <div class=\"panel panel-forum\">
   <div class=\"panel-heading\">
\t <i class=\"fa fa-bar-chart-o\"></i>&nbsp;";
                // line 15
                echo $this->env->getExtension('phpbb')->lang("LATEST_UNAPPROVED");
                echo "
\t</div>
\t<div class=\"panel-inner\">
    <table class=\"footable table table-striped table-primary table-hover\">
\t<thead>
\t\t<tr>
\t\t\t<th data-class=\"expand\">";
                // line 21
                echo $this->env->getExtension('phpbb')->lang("VIEW_DETAILS");
                echo "</th>
\t\t\t<th data-hide=\"phone\">";
                // line 22
                echo $this->env->getExtension('phpbb')->lang("TOPIC");
                echo "&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("FORUM");
                echo "</th>
\t\t\t<th data-hide=\"phone\">";
                // line 23
                echo $this->env->getExtension('phpbb')->lang("MARK");
                echo "</th>
\t\t</tr>
\t</thead>
\t<tbody>
\t";
                // line 27
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "unapproved", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["unapproved"]) {
                    // line 28
                    echo "\t    <tr>
\t\t\t<td>
\t\t\t    <a href=\"";
                    // line 30
                    echo $this->getAttribute($context["unapproved"], "U_POST_DETAILS", array());
                    echo "\" class=\"topictitle\">&nbsp;";
                    echo $this->getAttribute($context["unapproved"], "SUBJECT", array());
                    echo "</a>&nbsp;";
                    echo $this->getAttribute($context["unapproved"], "ATTACH_ICON_IMG", array());
                    echo "<br />
\t\t\t    ";
                    // line 31
                    echo $this->env->getExtension('phpbb')->lang("POST_BY_AUTHOR");
                    echo "&nbsp;";
                    echo $this->getAttribute($context["unapproved"], "AUTHOR_FULL", array());
                    echo "&nbsp;&#45;&nbsp;<small>";
                    echo $this->getAttribute($context["unapproved"], "POST_TIME", array());
                    echo "</small>
\t\t\t</td>
\t\t\t<td>
\t\t\t\t";
                    // line 34
                    echo $this->env->getExtension('phpbb')->lang("TOPIC");
                    echo $this->env->getExtension('phpbb')->lang("COLON");
                    echo "&nbsp;<a href=\"";
                    echo $this->getAttribute($context["unapproved"], "U_TOPIC", array());
                    echo "\">";
                    echo $this->getAttribute($context["unapproved"], "TOPIC_TITLE", array());
                    echo "</a>&nbsp;&#91;<a href=\"";
                    echo $this->getAttribute($context["unapproved"], "U_MCP_TOPIC", array());
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("MODERATE");
                    echo "</a>&#93;<br />
\t\t\t\t";
                    // line 35
                    echo $this->env->getExtension('phpbb')->lang("FORUM");
                    echo $this->env->getExtension('phpbb')->lang("COLON");
                    echo "&nbsp;";
                    if ($this->getAttribute($context["unapproved"], "U_FORUM", array())) {
                        echo "<a href=\"";
                        echo $this->getAttribute($context["unapproved"], "U_FORUM", array());
                        echo "\">";
                        echo $this->getAttribute($context["unapproved"], "FORUM_NAME", array());
                        echo "</a>";
                    } else {
                        echo $this->getAttribute($context["unapproved"], "FORUM_NAME", array());
                    }
                    if ($this->getAttribute($context["unapproved"], "U_MCP_FORUM", array())) {
                        echo " [<a href=\"";
                        echo $this->getAttribute($context["unapproved"], "U_MCP_FORUM", array());
                        echo "\">";
                        echo $this->env->getExtension('phpbb')->lang("MODERATE");
                        echo "</a>]";
                    }
                    // line 36
                    echo "\t\t\t</td>
\t\t\t<td><input type=\"checkbox\" id=\"un-";
                    // line 37
                    echo $this->getAttribute($context["unapproved"], "POST_ID", array());
                    echo "\" name=\"post_id_list[]\" value=\"";
                    echo $this->getAttribute($context["unapproved"], "POST_ID", array());
                    echo "\"><label for=\"un-";
                    echo $this->getAttribute($context["unapproved"], "POST_ID", array());
                    echo "\"></label></td>
\t\t</tr>\t\t\t
\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['unapproved'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 40
                echo "\t</tbody>
\t</table>
\t</div>
\t</div>
\t";
            } else {
                // line 45
                echo "\t<div class=\"alert alert-info fade in\">
        <button data-dismiss=\"alert\" class=\"close\" type=\"button\" aria-hidden=\"true\"><i class=\"awe-remove-circle\"></i></button>
        <i class=\"fa fa-warning\"></i>&nbsp;<strong>";
                // line 47
                echo $this->env->getExtension('phpbb')->lang("INFO_BOX");
                echo "</strong>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("MCP_UNAPPROVED_POSTS_ZERO");
                echo "
     </div> 
\t";
            }
            // line 50
            echo "\t";
            echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
            echo "

";
            // line 52
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "unapproved", array()))) {
                // line 53
                echo "<div class=\"clearfix\">
\t<div class=\"pull-left\">
\t<fieldset>
\t";
                // line 56
                echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
                echo "
\t<div class=\"btn-group\">
\t <button class=\"btn btn-default\" type=\"submit\" name=\"action[approve]\" id=\"action[approve]\" value=\"";
                // line 58
                echo $this->env->getExtension('phpbb')->lang("APPROVE");
                echo "\" title=\"\" data-original-title=\"";
                echo $this->env->getExtension('phpbb')->lang("APPROVE");
                echo "\"><i class=\"fa fa-thumbs-up\"></i></button>
\t <button class=\"btn btn-default\" type=\"submit\" name=\"action[disapprove]\" id=\"action[disapprove]\" value=\"";
                // line 59
                echo $this->env->getExtension('phpbb')->lang("DISAPPROVE");
                echo "\" title=\"\" data-original-title=\"";
                echo $this->env->getExtension('phpbb')->lang("DISAPPROVE");
                echo "\"><i class=\"fa fa-thumbs-down\"></i></button>
\t</div>
\t
\t<div class=\"btn-group\">
\t<a href=\"javascript:;\" onclick=\"marklist('mcp_queue', 'post_id_list', true); return false;\" class=\"btn btn-default\" title=\"\" data-original-title=\"";
                // line 63
                echo $this->env->getExtension('phpbb')->lang("MARK_ALL");
                echo "\"><i class=\"fa fa-check-square-o\"></i></a>
\t<a href=\"javascript:;\" onclick=\"marklist('mcp_queue', 'post_id_list', false); return false;\" class=\"btn btn-default\" title=\"\" data-original-title=\"";
                // line 64
                echo $this->env->getExtension('phpbb')->lang("UNMARK_ALL");
                echo "\"><i class=\"fa fa-square-o\"></i></a>
\t</div>
    </fieldset>
\t</div>
</div>
";
            }
            // line 70
            echo "</form>
<div class=\"space10\"></div>
 <div class=\"space10\"></div>
";
        }
        // line 74
        echo "

";
        // line 76
        // line 77
        if ((isset($context["S_SHOW_REPORTS"]) ? $context["S_SHOW_REPORTS"] : null)) {
            // line 78
            echo "  <div class=\"space10\"></div>
   <div class=\"space10\"></div>
\t<div class=\"side-segment\"><h3>";
            // line 80
            echo $this->env->getExtension('phpbb')->lang("LATEST_REPORTED");
            echo "</h3></div>
\t\t";
            // line 81
            if ((isset($context["S_HAS_REPORTS"]) ? $context["S_HAS_REPORTS"] : null)) {
                echo "<p>";
                echo $this->env->getExtension('phpbb')->lang("REPORTS_TOTAL");
                echo "</p>";
            }
            // line 82
            echo "
\t";
            // line 83
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "report", array()))) {
                // line 84
                echo "\t <div class=\"panel panel-forum\">
\t <div class=\"panel-heading\">
\t <i class=\"fa fa-bar-chart-o\"></i>&nbsp;";
                // line 86
                echo $this->env->getExtension('phpbb')->lang("LATEST_REPORTED");
                echo "
\t</div>
\t<div class=\"panel-inner\">
\t<table class=\"footable table table-striped table-primary table-hover\">
\t<thead>
\t\t<tr>
\t\t\t<th data-class=\"expand\">";
                // line 92
                echo $this->env->getExtension('phpbb')->lang("VIEW_DETAILS");
                echo "</th>
\t\t\t<th data-hide=\"phone\">";
                // line 93
                echo $this->env->getExtension('phpbb')->lang("REPORTER");
                echo "&nbsp;&amp;&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("FORUM");
                echo "</th>
\t\t</tr>
\t</thead>\t\t
\t<tbody>
\t";
                // line 97
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "report", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["report"]) {
                    // line 98
                    echo "\t\t\t <tr>
\t\t\t\t<td>
\t\t\t\t<a href=\"";
                    // line 100
                    echo $this->getAttribute($context["report"], "U_POST_DETAILS", array());
                    echo "#reports\" class=\"topictitle\">";
                    echo $this->getAttribute($context["report"], "SUBJECT", array());
                    echo "</a>&nbsp;";
                    echo $this->getAttribute($context["report"], "ATTACH_ICON_IMG", array());
                    echo "<br />
\t\t\t\t";
                    // line 101
                    echo $this->env->getExtension('phpbb')->lang("POST_BY_AUTHOR");
                    echo "&nbsp;";
                    echo $this->getAttribute($context["report"], "AUTHOR_FULL", array());
                    echo "&nbsp;&#45;&nbsp;<small>&nbsp;";
                    echo $this->getAttribute($context["report"], "POST_TIME", array());
                    echo "</small>
\t\t\t\t</td>
\t\t\t
\t\t\t\t<td class=\"center\">
\t\t\t\t";
                    // line 105
                    echo $this->env->getExtension('phpbb')->lang("REPORTED");
                    echo "&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("POST_BY_AUTHOR");
                    echo "&nbsp;";
                    echo $this->getAttribute($context["report"], "REPORTER_FULL", array());
                    echo "&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("REPORTED_ON_DATE");
                    echo "&nbsp;<small>";
                    echo $this->getAttribute($context["report"], "REPORT_TIME", array());
                    echo "</small> <br />
\t\t\t\t";
                    // line 106
                    echo $this->env->getExtension('phpbb')->lang("FORUM");
                    echo $this->env->getExtension('phpbb')->lang("COLON");
                    echo "&nbsp;<a href=\"";
                    echo $this->getAttribute($context["report"], "U_FORUM", array());
                    echo "\">";
                    echo $this->getAttribute($context["report"], "FORUM_NAME", array());
                    echo "</a>
\t\t\t\t</td>
\t\t     </tr>\t
\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['report'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 110
                echo "\t</tbody>
\t</table>
\t</div>
\t</div>
\t";
            } else {
                // line 115
                echo "\t<div class=\"alert alert-info fade in\">
        <button data-dismiss=\"alert\" class=\"close\" type=\"button\" aria-hidden=\"true\"><i class=\"awe-remove-circle\"></i></button>
        <i class=\"fa fa-warning\"></i>&nbsp;<strong>";
                // line 117
                echo $this->env->getExtension('phpbb')->lang("INFO_BOX");
                echo "</strong>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("MCP_REPORTS_ZERO");
                echo "
    </div> 
\t";
            }
        }
        // line 121
        echo "

";
        // line 123
        // line 124
        if ((isset($context["S_SHOW_PM_REPORTS"]) ? $context["S_SHOW_PM_REPORTS"] : null)) {
            // line 125
            echo "\t\t<div class=\"side-segment\"><h3>";
            echo $this->env->getExtension('phpbb')->lang("LATEST_REPORTED_PMS");
            echo "</h3></div>
\t\t";
            // line 126
            if ((isset($context["S_HAS_PM_REPORTS"]) ? $context["S_HAS_PM_REPORTS"] : null)) {
                echo "<p>";
                echo $this->env->getExtension('phpbb')->lang("PM_REPORTS_TOTAL");
                echo "</p>";
            }
            // line 127
            echo "
";
            // line 128
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pm_report", array()))) {
                // line 129
                echo " <div class=\"panel panel-forum\">
    <div class=\"panel-heading\">
\t <i class=\"fa fa-bolt\"></i>&nbsp;";
                // line 131
                echo $this->env->getExtension('phpbb')->lang("LATEST_REPORTED_PMS");
                echo "
\t</div>
\t<div class=\"panel-inner\">
\t<table class=\"footable table table-striped table-primary table-hover\">
\t<thead>
\t\t<tr>
\t\t\t<th data-class=\"expand\">";
                // line 137
                echo $this->env->getExtension('phpbb')->lang("VIEW_DETAILS");
                echo "</th>
\t\t\t<th data-hide=\"phone\">";
                // line 138
                echo $this->env->getExtension('phpbb')->lang("REPORTER");
                echo "</th>
\t\t</tr>
\t</thead>\t\t
\t<tbody>
\t";
                // line 142
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pm_report", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["pm_report"]) {
                    // line 143
                    echo "\t\t<tr>
\t\t\t<td>
\t\t\t<a href=\"";
                    // line 145
                    echo $this->getAttribute($context["pm_report"], "U_PM_DETAILS", array());
                    echo "\" class=\"topictitle\">";
                    echo $this->getAttribute($context["pm_report"], "PM_SUBJECT", array());
                    echo "</a>&nbsp;";
                    echo $this->getAttribute($context["pm_report"], "ATTACH_ICON_IMG", array());
                    echo "<br />
\t\t\t";
                    // line 146
                    echo $this->env->getExtension('phpbb')->lang("MESSAGE_BY_AUTHOR");
                    echo "&nbsp;";
                    echo $this->getAttribute($context["pm_report"], "PM_AUTHOR_FULL", array());
                    echo "&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("MESSAGE_TO");
                    echo "&nbsp;";
                    echo $this->getAttribute($context["pm_report"], "RECIPIENTS", array());
                    echo "&nbsp;&#45;
\t\t\t<small>";
                    // line 147
                    echo $this->getAttribute($context["pm_report"], "PM_TIME", array());
                    echo "</small>
\t\t\t</td>
\t\t\t
\t\t\t<td class=\"center\">
\t\t\t";
                    // line 151
                    echo $this->env->getExtension('phpbb')->lang("REPORTED");
                    echo "&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("POST_BY_AUTHOR");
                    echo "&nbsp;";
                    echo $this->getAttribute($context["pm_report"], "REPORTER_FULL", array());
                    echo " 
\t\t\t<br />";
                    // line 152
                    echo $this->env->getExtension('phpbb')->lang("REPORTED_ON_DATE");
                    echo "&nbsp;<small>";
                    echo $this->getAttribute($context["pm_report"], "REPORT_TIME", array());
                    echo "</small>
\t\t\t</td>
\t\t</tr>\t
\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['pm_report'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 156
                echo "\t\t</tbody>
\t</table>
\t</div>
\t</div>
\t";
            } else {
                // line 161
                echo "\t<div class=\"alert alert-info fade in\">
        <button data-dismiss=\"alert\" class=\"close\" type=\"button\" aria-hidden=\"true\"><i class=\"awe-remove-circle\"></i></button>
        <i class=\"fa fa-warning\"></i>&nbsp;<strong>";
                // line 163
                echo $this->env->getExtension('phpbb')->lang("INFO_BOX");
                echo "</strong>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("MCP_PM_REPORTS_ZERO");
                echo "
     </div> 
\t";
            }
        }
        // line 167
        echo "

";
        // line 169
        // line 170
        if ((isset($context["S_SHOW_LOGS"]) ? $context["S_SHOW_LOGS"] : null)) {
            // line 171
            echo "  <div class=\"space10\"></div>
\t<div class=\"side-segment\"><h3>";
            // line 172
            echo $this->env->getExtension('phpbb')->lang("LATEST_LOGS");
            echo "</h3></div>
 <div class=\"panel panel-forum\">
    <div class=\"panel-heading\">
\t <i class=\"fa fa-bolt\"></i>&nbsp;";
            // line 175
            echo $this->env->getExtension('phpbb')->lang("LATEST_LOGS");
            echo "
\t</div>
\t<div class=\"panel-inner\">
\t<table class=\"footable table table-striped table-primary table-hover\">
\t\t<thead>
\t\t<tr>
\t\t\t<th data-class=\"expand\">";
            // line 181
            echo $this->env->getExtension('phpbb')->lang("ACTION");
            echo "</th>
\t\t\t<th data-hide=\"phone\">";
            // line 182
            echo $this->env->getExtension('phpbb')->lang("MCP_DETAIL_U_IP");
            echo "</th>
\t\t\t<th data-hide=\"phone\" class=\"large12\">";
            // line 183
            echo $this->env->getExtension('phpbb')->lang("MCP_DETAILS_LOG");
            echo "</th>
\t\t\t<th data-hide=\"phone\">";
            // line 184
            echo $this->env->getExtension('phpbb')->lang("TIME");
            echo "</th>
\t\t</tr>
\t\t</thead>
\t\t<tbody>
\t";
            // line 188
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "log", array()));
            $context['_iterated'] = false;
            foreach ($context['_seq'] as $context["_key"] => $context["log"]) {
                // line 189
                echo "\t\t<tr>
\t\t\t<td>";
                // line 190
                echo $this->getAttribute($context["log"], "ACTION", array());
                echo "</td>
\t\t\t<td>";
                // line 191
                echo $this->getAttribute($context["log"], "USERNAME", array());
                echo "&nbsp;";
                echo $this->getAttribute($context["log"], "IP", array());
                echo "</td>
\t\t\t<td >
\t\t\t";
                // line 193
                if ($this->getAttribute($context["log"], "U_VIEW_TOPIC", array())) {
                    echo "<a href=\"";
                    echo $this->getAttribute($context["log"], "U_VIEW_TOPIC", array());
                    echo "\" title=\"";
                    echo $this->env->getExtension('phpbb')->lang("VIEW_TOPIC");
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("VIEW_TOPIC");
                    echo "</a>";
                }
                echo "<br>
\t\t\t";
                // line 194
                if ($this->getAttribute($context["log"], "U_VIEWLOGS", array())) {
                    echo "<a href=\"";
                    echo $this->getAttribute($context["log"], "U_VIEWLOGS", array());
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("VIEW_TOPIC_LOGS");
                    echo "</a>";
                }
                // line 195
                echo "\t\t\t</td>
\t\t\t<td><small>";
                // line 196
                echo $this->getAttribute($context["log"], "TIME", array());
                echo "</small></td>
\t\t</tr>
\t";
                $context['_iterated'] = true;
            }
            if (!$context['_iterated']) {
                // line 199
                echo "\t\t<tr>
\t\t\t<td colspan=\"0\">";
                // line 200
                echo $this->env->getExtension('phpbb')->lang("NO_ENTRIES");
                echo "</td>
\t\t</tr>
\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['log'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 203
            echo "\t\t</tbody>
\t</table>
\t</div>
</div>
";
        }
        // line 208
        // line 209
        echo "
</div>
";
        // line 211
        $location = "mcp_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("mcp_footer.html", "mcp_front.html", 211)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "mcp_front.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  602 => 211,  598 => 209,  597 => 208,  590 => 203,  581 => 200,  578 => 199,  570 => 196,  567 => 195,  559 => 194,  547 => 193,  540 => 191,  536 => 190,  533 => 189,  528 => 188,  521 => 184,  517 => 183,  513 => 182,  509 => 181,  500 => 175,  494 => 172,  491 => 171,  489 => 170,  488 => 169,  484 => 167,  475 => 163,  471 => 161,  464 => 156,  452 => 152,  444 => 151,  437 => 147,  427 => 146,  419 => 145,  415 => 143,  411 => 142,  404 => 138,  400 => 137,  391 => 131,  387 => 129,  385 => 128,  382 => 127,  376 => 126,  371 => 125,  369 => 124,  368 => 123,  364 => 121,  355 => 117,  351 => 115,  344 => 110,  329 => 106,  317 => 105,  306 => 101,  298 => 100,  294 => 98,  290 => 97,  281 => 93,  277 => 92,  268 => 86,  264 => 84,  262 => 83,  259 => 82,  253 => 81,  249 => 80,  245 => 78,  243 => 77,  242 => 76,  238 => 74,  232 => 70,  223 => 64,  219 => 63,  210 => 59,  204 => 58,  199 => 56,  194 => 53,  192 => 52,  186 => 50,  178 => 47,  174 => 45,  167 => 40,  154 => 37,  151 => 36,  131 => 35,  118 => 34,  108 => 31,  100 => 30,  96 => 28,  92 => 27,  85 => 23,  79 => 22,  75 => 21,  66 => 15,  60 => 12,  57 => 11,  51 => 10,  46 => 8,  41 => 7,  39 => 6,  36 => 5,  31 => 2,  19 => 1,);
    }
}
