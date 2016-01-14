<?php

/* forumlist_body.html */
class __TwigTemplate_9c01ceffbfe00e415493747a3bb016eb36d7de5cc92bf565ecdcefc181cf1f05 extends Twig_Template
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
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "forumrow", array()));
        $context['_iterated'] = false;
        foreach ($context['_seq'] as $context["_key"] => $context["forumrow"]) {
            // line 2
            echo "\t";
            if ((($this->getAttribute($context["forumrow"], "S_IS_CAT", array()) &&  !$this->getAttribute($context["forumrow"], "S_FIRST_ROW", array())) || $this->getAttribute($context["forumrow"], "S_NO_CAT", array()))) {
                // line 3
                echo "\t    
\t\t<!-- Table footer not used at the moment
\t\t\t<tfoot>
             <tr>
                <th>Game Name</th>
                <th>Publisher</th>
                <th>Platform</th>
             </tr>
            </tfoot>
\t\tTable footer not used at the moment -->
\t\t\t
\t\t</table>
\t\t</div>
\t\t</div>
\t";
                // line 17
                echo "\t
\t";
            }
            // line 19
            echo "\t
    ";
            // line 20
            // line 21
            echo "\t";
            if ((($this->getAttribute($context["forumrow"], "S_IS_CAT", array()) || $this->getAttribute($context["forumrow"], "S_FIRST_ROW", array())) || $this->getAttribute($context["forumrow"], "S_NO_CAT", array()))) {
                // line 22
                echo "\t   <div class=\"panel panel-forum\">
\t     <div class=\"panel-heading\">
\t\t  ";
                // line 24
                if ($this->getAttribute($context["forumrow"], "S_IS_CAT", array())) {
                    echo "<a href=\"";
                    echo $this->getAttribute($context["forumrow"], "U_VIEWFORUM", array());
                    echo "\">";
                    echo $this->getAttribute($context["forumrow"], "FORUM_NAME", array());
                    echo "</a>";
                } elseif ($this->getAttribute($context["forumrow"], "S_IS_LINK", array())) {
                    echo $this->env->getExtension('phpbb')->lang("LINKS");
                } else {
                    echo $this->env->getExtension('phpbb')->lang("FORUM");
                }
                // line 25
                echo "\t\t </div>
\t\t <div class=\"panel-inner\">
\t\t<table class=\"footable table table-striped table-primary table-hover\">
\t\t<thead>
\t\t";
                // line 29
                // line 30
                echo "\t\t\t<tr>
\t\t\t <th data-class=\"expand\">";
                // line 31
                echo $this->env->getExtension('phpbb')->lang("TITLE");
                echo "</th>
\t\t\t <th class=\"large110\" data-hide=\"phone\">";
                // line 32
                echo $this->env->getExtension('phpbb')->lang("TOPICS_POSTS_STATISTICS");
                echo "</th>
\t\t\t <th class=\"large21\" data-hide=\"phone\">";
                // line 33
                echo $this->env->getExtension('phpbb')->lang("LAST_POST");
                echo "</th>
\t\t\t</tr>
\t\t";
                // line 35
                echo "\t
\t\t</thead>
\t<tbody>
\t";
            }
            // line 39
            echo "\t";
            // line 40
            echo "\t
\t";
            // line 41
            if ( !$this->getAttribute($context["forumrow"], "S_IS_CAT", array())) {
                // line 42
                echo "\t";
                // line 43
                echo "\t    <tr>
\t\t";
                // line 44
                // line 45
                echo "\t\t\t<td title=\"";
                echo $this->getAttribute($context["forumrow"], "FORUM_FOLDER_IMG_ALT", array());
                echo "\">
\t\t\t";
                // line 46
                if ($this->getAttribute($context["forumrow"], "FORUM_IMAGE", array())) {
                    // line 47
                    echo "\t\t\t<span class=\"forum-image\">";
                    echo $this->getAttribute($context["forumrow"], "FORUM_IMAGE", array());
                    echo "</span>
\t\t\t";
                } else {
                    // line 49
                    echo "\t\t\t<span class=\"icon-wrapper\">
\t\t\t <i class=\"row-icon-font icon-moon-default";
                    // line 50
                    if ($this->getAttribute($context["forumrow"], "S_IS_LINK", array())) {
                        echo " icon-moon-link2";
                    }
                    if ($this->getAttribute($context["forumrow"], "S_UNREAD_FORUM", array())) {
                        echo " forum-unread";
                    } else {
                        echo " forum-read";
                    }
                    echo "\" title=\"";
                    echo $this->getAttribute($context["forumrow"], "FORUM_FOLDER_IMG_ALT", array());
                    echo "\"></i>
\t\t\t</span>
\t\t\t";
                }
                // line 53
                echo "\t\t\t<i class=\"row-icon-font-mini ";
                if ($this->getAttribute($context["forumrow"], "S_LOCKED_FORUM", array())) {
                    echo "icon-moon-lock forum-list-lock";
                }
                echo "\" title=\"";
                echo $this->getAttribute($context["forumrow"], "FORUM_FOLDER_IMG_ALT", array());
                echo "\"></i>
\t\t\t";
                // line 54
                if (((isset($context["S_ENABLE_FEEDS"]) ? $context["S_ENABLE_FEEDS"] : null) && $this->getAttribute($context["forumrow"], "S_FEED_ENABLED", array()))) {
                    echo " <a class=\"btn-rss pull-right hidden-xs hidden-sm\" title=\"";
                    echo $this->env->getExtension('phpbb')->lang("FEED");
                    echo " - ";
                    echo $this->getAttribute($context["forumrow"], "FORUM_NAME", array());
                    echo "\" href=\"";
                    echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                    echo "?f=";
                    echo $this->getAttribute($context["forumrow"], "FORUM_ID", array());
                    echo "\"><i class=\"fa fa-rss rss-color-forum\"></i></a>";
                }
                // line 55
                echo "\t\t\t  <span class=\"desc-wrapper\">
\t\t\t\t<a href=\"";
                // line 56
                echo $this->getAttribute($context["forumrow"], "U_VIEWFORUM", array());
                echo "\" class=\"forumtitle\">";
                echo $this->getAttribute($context["forumrow"], "FORUM_NAME", array());
                echo "</a><br />
\t\t\t\t";
                // line 57
                if ($this->getAttribute($context["forumrow"], "FORUM_DESC", array())) {
                    echo "<span class=\"description\">";
                    echo $this->getAttribute($context["forumrow"], "FORUM_DESC", array());
                    echo "</span><br />";
                }
                // line 58
                echo "\t\t\t\t";
                if ($this->getAttribute($context["forumrow"], "MODERATORS", array())) {
                    // line 59
                    echo "\t\t\t\t<span class=\"forum-mods\"><strong>";
                    echo $this->getAttribute($context["forumrow"], "L_MODERATOR_STR", array());
                    echo $this->env->getExtension('phpbb')->lang("COLON");
                    echo "</strong>&nbsp;";
                    echo $this->getAttribute($context["forumrow"], "MODERATORS", array());
                    echo "</span>
\t\t\t\t";
                }
                // line 61
                echo "\t\t\t\t";
                if (($this->getAttribute($context["forumrow"], "SUBFORUMS", array()) && $this->getAttribute($context["forumrow"], "S_LIST_SUBFORUMS", array()))) {
                    // line 62
                    echo "\t\t\t\t ";
                    // line 63
                    echo "\t\t\t\t <span class=\"subforums\">
\t\t\t\t  <strong>";
                    // line 64
                    echo $this->getAttribute($context["forumrow"], "L_SUBFORUM_STR", array());
                    echo "</strong>
                    ";
                    // line 65
                    $context['_parent'] = (array) $context;
                    $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["forumrow"], "subforum", array()));
                    foreach ($context['_seq'] as $context["_key"] => $context["subforum"]) {
                        echo "\t\t\t\t  
\t\t\t\t     <a href=\"";
                        // line 66
                        echo $this->getAttribute($context["subforum"], "U_SUBFORUM", array());
                        echo "\" class=\"subforum";
                        if ($this->getAttribute($context["subforum"], "S_UNREAD", array())) {
                            echo " unread";
                        } else {
                            echo " read";
                        }
                        echo "\" title=\"";
                        if ($this->getAttribute($context["subforum"], "S_UNREAD", array())) {
                            echo $this->env->getExtension('phpbb')->lang("UNREAD_POSTS");
                        } else {
                            echo $this->env->getExtension('phpbb')->lang("NO_UNREAD_POSTS");
                        }
                        echo "\">";
                        echo $this->getAttribute($context["subforum"], "SUBFORUM_NAME", array());
                        echo "</a>";
                        if ( !$this->getAttribute($context["subforum"], "S_LAST_ROW", array())) {
                            echo $this->env->getExtension('phpbb')->lang("COMMA_SEPARATOR");
                        }
                        // line 67
                        echo "\t\t\t\t\t";
                    }
                    $_parent = $context['_parent'];
                    unset($context['_seq'], $context['_iterated'], $context['_key'], $context['subforum'], $context['_parent'], $context['loop']);
                    $context = array_intersect_key($context, $_parent) + $_parent;
                    echo " 
\t\t\t\t </span>
\t\t\t\t ";
                    // line 69
                    // line 70
                    echo "\t\t\t\t";
                }
                // line 71
                echo "\t\t\t  </span>
\t\t\t</td>
\t\t\t";
                // line 73
                if ($this->getAttribute($context["forumrow"], "CLICKS", array())) {
                    // line 74
                    echo "\t\t\t<td colspan=\"2\"><span class=\"stats-wrapper\">";
                    echo $this->env->getExtension('phpbb')->lang("FORUM_REDIRECTS");
                    echo "&nbsp;";
                    echo $this->getAttribute($context["forumrow"], "CLICKS", array());
                    echo "</span></td>\t
\t\t\t";
                } elseif ( !$this->getAttribute(                // line 75
$context["forumrow"], "S_IS_LINK", array())) {
                    // line 76
                    echo "\t\t\t<td class=\"stats-col\">
\t\t\t <span class=\"stats-wrapper\">
\t\t\t ";
                    // line 78
                    echo $this->getAttribute($context["forumrow"], "TOPICS", array());
                    echo "&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("TOPICS");
                    echo "&nbsp;<br />";
                    echo $this->getAttribute($context["forumrow"], "POSTS", array());
                    echo "&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("POSTS");
                    echo " 
\t\t\t ";
                    // line 79
                    if ($this->getAttribute($context["forumrow"], "U_UNAPPROVED_TOPICS", array())) {
                        // line 80
                        echo "\t\t\t  <a href=\"";
                        echo $this->getAttribute($context["forumrow"], "U_UNAPPROVED_TOPICS", array());
                        echo "\" title=\"";
                        echo $this->env->getExtension('phpbb')->lang("FORUMLIST_UNAPPROVED");
                        echo "\"><i class=\"fa fa-question-circle\"></i></a>
\t\t\t ";
                    } elseif ($this->getAttribute(                    // line 81
$context["forumrow"], "U_UNAPPROVED_POSTS", array())) {
                        // line 82
                        echo "\t\t\t  <a href=\"";
                        echo $this->getAttribute($context["forumrow"], "U_UNAPPROVED_POSTS", array());
                        echo "\" title=\"";
                        echo $this->env->getExtension('phpbb')->lang("FORUMLIST_UNAPPROVED_POST");
                        echo "\"><i class=\"fa fa-question-circle\"></i></a>
\t\t\t ";
                    }
                    // line 84
                    echo "\t\t\t </span>
\t\t\t</td>\t
\t\t\t<td>
\t\t\t  <span class=\"last-wrapper text-overflow\">
\t\t\t   ";
                    // line 88
                    // line 89
                    echo "\t\t\t\t";
                    if ($this->getAttribute($context["forumrow"], "S_DISPLAY_SUBJECT", array())) {
                        // line 90
                        echo "\t\t\t\t ";
                        // line 91
                        echo "\t\t\t\t <a href=\"";
                        echo $this->getAttribute($context["forumrow"], "U_LAST_POST", array());
                        echo "\" title=\"\" class=\"lastsubject\">";
                        echo $this->getAttribute($context["forumrow"], "LAST_POST_SUBJECT_TRUNCATED", array());
                        echo "</a><br />
\t\t\t\t";
                    }
                    // line 93
                    echo "\t\t\t\t";
                    if ($this->getAttribute($context["forumrow"], "LAST_POST_TIME", array())) {
                        echo $this->env->getExtension('phpbb')->lang("POST_BY_AUTHOR");
                        echo "&nbsp;";
                        echo $this->getAttribute($context["forumrow"], "LAST_POSTER_FULL", array());
                        echo "
\t\t\t\t";
                        // line 94
                        if ( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null)) {
                            echo "<a class=\"moderator-item\" href=\"";
                            echo $this->getAttribute($context["forumrow"], "U_LAST_POST", array());
                            echo "\" title=\"";
                            echo $this->env->getExtension('phpbb')->lang("FORUMLIST_LASTPOST");
                            echo "\"><i class=\"mobile-post fa fa-sign-out\"></i></a>";
                        }
                        // line 95
                        echo "\t\t\t\t<br /><span class=\"forum-time\">";
                        echo $this->getAttribute($context["forumrow"], "LAST_POST_TIME", array());
                        echo "</span>";
                    } else {
                        echo $this->env->getExtension('phpbb')->lang("NO_POSTS");
                        echo "&nbsp;";
                    }
                    // line 96
                    echo "\t\t\t  </span>
\t\t\t</td>
\t\t\t";
                }
                // line 99
                echo "\t\t";
                echo "\t
\t\t</tr>
\t";
                // line 101
                echo "\t
\t";
            }
            // line 103
            echo "
\t";
            // line 104
            if ($this->getAttribute($context["forumrow"], "S_LAST_ROW", array())) {
                // line 105
                echo "\t </tbody>
\t</table>
\t</div>
\t</div>
\t";
                // line 109
                // line 110
                echo "\t";
            }
            // line 111
            echo "
";
            $context['_iterated'] = true;
        }
        if (!$context['_iterated']) {
            // line 113
            echo "\t<div class=\"well\">
\t\t<strong>";
            // line 114
            echo $this->env->getExtension('phpbb')->lang("NO_FORUMS");
            echo "</strong>
\t</div>
";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['forumrow'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
    }

    public function getTemplateName()
    {
        return "forumlist_body.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  372 => 114,  369 => 113,  363 => 111,  360 => 110,  359 => 109,  353 => 105,  351 => 104,  348 => 103,  344 => 101,  339 => 99,  334 => 96,  326 => 95,  318 => 94,  310 => 93,  302 => 91,  300 => 90,  297 => 89,  296 => 88,  290 => 84,  282 => 82,  280 => 81,  273 => 80,  271 => 79,  261 => 78,  257 => 76,  255 => 75,  248 => 74,  246 => 73,  242 => 71,  239 => 70,  238 => 69,  229 => 67,  209 => 66,  203 => 65,  199 => 64,  196 => 63,  194 => 62,  191 => 61,  182 => 59,  179 => 58,  173 => 57,  167 => 56,  164 => 55,  152 => 54,  143 => 53,  128 => 50,  125 => 49,  119 => 47,  117 => 46,  112 => 45,  111 => 44,  108 => 43,  106 => 42,  104 => 41,  101 => 40,  99 => 39,  93 => 35,  88 => 33,  84 => 32,  80 => 31,  77 => 30,  76 => 29,  70 => 25,  58 => 24,  54 => 22,  51 => 21,  50 => 20,  47 => 19,  43 => 17,  27 => 3,  24 => 2,  19 => 1,);
    }
}
