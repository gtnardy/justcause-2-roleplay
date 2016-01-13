<?php

/* acp_ext_details.html */
class __TwigTemplate_567022b6bf9b5b4daadb001a6e2744f3a2e9881a9044c97bbcd14ebf17db84be extends Twig_Template
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
        echo "<a href=\"";
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "\" id=\"upload_load_main\">";
        echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_EXT_TITLE");
        echo "</a> &raquo; <a href=\"";
        echo (isset($context["U_ACTION_LIST"]) ? $context["U_ACTION_LIST"] : null);
        echo "\" id=\"upload_load_main_list\">";
        echo $this->env->getExtension('phpbb')->lang("EXTENSIONS_ADMIN");
        echo "</a> &raquo; <strong>";
        echo (isset($context["META_DISPLAY_NAME"]) ? $context["META_DISPLAY_NAME"] : null);
        echo "</strong>
<a href=\"";
        // line 2
        echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
        echo "\" class=\"ext_reload_link upload_get_details_link\" data-ext-name=\"";
        echo (isset($context["META_NAME"]) ? $context["META_NAME"] : null);
        echo "\"";
        if ((isset($context["EXT_LOAD_LANG"]) ? $context["EXT_LOAD_LANG"] : null)) {
            echo " data-ext-lang=\"";
            echo (isset($context["EXT_LOAD_LANG"]) ? $context["EXT_LOAD_LANG"] : null);
            echo "\"";
        }
        echo " data-upload-ext=\"true\" title=\"";
        echo $this->env->getExtension('phpbb')->lang("EXT_RELOAD_PAGE");
        echo "\"><i class=\"fa fa-refresh\"></i></a>
<hr class=\"upload_ext_navigation\" />
<h1 class=\"ExtensionName\"><i class=\"fa fa-cog\"></i> ";
        // line 4
        echo (isset($context["META_DISPLAY_NAME"]) ? $context["META_DISPLAY_NAME"] : null);
        echo "</h1>
";
        // line 5
        if (((isset($context["S_UPLOAD_VERSIONCHECK"]) ? $context["S_UPLOAD_VERSIONCHECK"] : null) && (isset($context["S_UPLOAD_UP_TO_DATE"]) ? $context["S_UPLOAD_UP_TO_DATE"] : null))) {
            // line 6
            echo "<div class=\"description_bubble small_bubble ext_version_bubble\" title=\"";
            echo (isset($context["UPLOAD_UP_TO_DATE_MSG"]) ? $context["UPLOAD_UP_TO_DATE_MSG"] : null);
            echo "\">
\t<span class=\"description_name\">";
            // line 7
            echo $this->env->getExtension('phpbb')->lang("VERSION");
            echo "</span>
\t<span class=\"description_value description_value_ok\" id=\"meta_version\">";
            // line 8
            echo (isset($context["META_VERSION"]) ? $context["META_VERSION"] : null);
            echo "</span>
</div>
";
        } elseif ((        // line 10
(isset($context["S_UPLOAD_VERSIONCHECK"]) ? $context["S_UPLOAD_VERSIONCHECK"] : null) &&  !(isset($context["S_UPLOAD_UP_TO_DATE"]) ? $context["S_UPLOAD_UP_TO_DATE"] : null))) {
            // line 11
            echo "<div class=\"description_bubble small_bubble ext_version_bubble\" title=\"";
            echo (isset($context["UPLOAD_UP_TO_DATE_MSG"]) ? $context["UPLOAD_UP_TO_DATE_MSG"] : null);
            echo "\">
\t<span class=\"description_name\">";
            // line 12
            echo $this->env->getExtension('phpbb')->lang("VERSION");
            echo "</span>
\t<span class=\"description_value description_value_old\" id=\"meta_version\">";
            // line 13
            echo (isset($context["META_VERSION"]) ? $context["META_VERSION"] : null);
            echo "</span>
</div>
";
        } else {
            // line 16
            echo "<div class=\"description_bubble small_bubble ext_version_bubble\">
\t<span class=\"description_name\">";
            // line 17
            echo $this->env->getExtension('phpbb')->lang("VERSION");
            echo "</span>
\t<span class=\"description_value\" id=\"meta_version\">";
            // line 18
            echo (isset($context["META_VERSION"]) ? $context["META_VERSION"] : null);
            echo "</span>
</div>
";
        }
        // line 21
        if ((isset($context["S_UPLOAD_VERSIONCHECK"]) ? $context["S_UPLOAD_VERSIONCHECK"] : null)) {
        } elseif ((        // line 22
(isset($context["S_UPLOAD_VERSIONCHECK_STATUS"]) ? $context["S_UPLOAD_VERSIONCHECK_STATUS"] : null) == 0)) {
            // line 23
            echo "<div class=\"errorbox notice\">
\t<p>";
            // line 24
            echo $this->env->getExtension('phpbb')->lang("VERSIONCHECK_FAIL");
            echo "</p>
\t<p>";
            // line 25
            echo (isset($context["UPLOAD_VERSIONCHECK_FAIL_REASON"]) ? $context["UPLOAD_VERSIONCHECK_FAIL_REASON"] : null);
            echo "</p>
\t<p><a href=\"";
            // line 26
            echo (isset($context["U_VERSIONCHECK_FORCE"]) ? $context["U_VERSIONCHECK_FORCE"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("VERSIONCHECK_FORCE_UPDATE");
            echo "</a></p>
</div>
";
        } elseif ((        // line 28
(isset($context["S_UPLOAD_VERSIONCHECK_STATUS"]) ? $context["S_UPLOAD_VERSIONCHECK_STATUS"] : null) == 1)) {
            // line 29
            echo "<div class=\"errorbox notice\">
\t<p>";
            // line 30
            echo (isset($context["UPLOAD_VERSIONCHECK_FAIL_REASON"]) ? $context["UPLOAD_VERSIONCHECK_FAIL_REASON"] : null);
            echo "</p>
</div>
";
        }
        // line 33
        if ((isset($context["EXT_LANGUAGE_UPLOADED"]) ? $context["EXT_LANGUAGE_UPLOADED"] : null)) {
            // line 34
            echo "<div class=\"ext_uploaded_notice\">
\t<h1><i class=\"fa fa-check\" id=\"uploaded_ok\"></i>";
            // line 35
            echo (isset($context["EXT_LANGUAGE_UPLOADED"]) ? $context["EXT_LANGUAGE_UPLOADED"] : null);
            echo "</h1>
</div>
";
        }
        // line 38
        if ((isset($context["S_EXTENSION_CHECKSUM_NOT_PROVIDED"]) ? $context["S_EXTENSION_CHECKSUM_NOT_PROVIDED"] : null)) {
            // line 39
            echo "<div class=\"ext_updated_notice\">
\t<h1><i class=\"fa fa-exclamation-circle\"></i> ";
            // line 40
            echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_EXT_NO_CHECKSUM_TITLE");
            echo "</h1>
\t<p>";
            // line 41
            echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_EXT_NO_CHECKSUM");
            echo "</p>
</div>
";
        }
        // line 44
        echo "<div class=\"ext_details_container\">
\t<div class=\"ext_details_tabs\">
\t\t<ul>
\t\t\t<li class=\"tab";
        // line 47
        if (((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "details")) {
            echo " activetab";
        }
        echo "\" id=\"ext_details_main_tab\"><a href=\"";
        echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
        echo "&amp;ext_show=details\"><i class=\"fa fa-book\"></i> <span>";
        echo $this->env->getExtension('phpbb')->lang("EXT_DETAILS");
        echo "</span></a></li>
\t\t\t";
        // line 48
        if ((isset($context["EXT_DETAILS_README"]) ? $context["EXT_DETAILS_README"] : null)) {
            echo "<li class=\"tab";
            if (((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "readme")) {
                echo " activetab";
            }
            echo "\" id=\"ext_details_readme_tab\"><a href=\"";
            echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
            echo "&amp;ext_show=readme\"><i class=\"fa fa-info\"></i> <span>";
            echo $this->env->getExtension('phpbb')->lang("EXT_DETAILS_README");
            echo "</span></a></li>";
        }
        // line 49
        echo "\t\t\t";
        if ((isset($context["EXT_DETAILS_CHANGELOG"]) ? $context["EXT_DETAILS_CHANGELOG"] : null)) {
            echo "<li class=\"tab";
            if (((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "changelog")) {
                echo " activetab";
            }
            echo "\" id=\"ext_details_changelog_tab\"><a href=\"";
            echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
            echo "&amp;ext_show=changelog\"><i class=\"fa fa-pencil\"></i> <span>";
            echo $this->env->getExtension('phpbb')->lang("EXT_DETAILS_CHANGELOG");
            echo "</span></a></li>";
        }
        // line 50
        echo "\t\t\t<li class=\"tab";
        if (((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "faq")) {
            echo " activetab";
        }
        echo "\" id=\"ext_details_faq_tab\"><a href=\"";
        echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
        echo "&amp;ext_show=faq\"><i class=\"fa fa-question-circle\"></i> <span>";
        echo $this->env->getExtension('phpbb')->lang("FAQ");
        echo "</span></a></li>
\t\t\t<li class=\"tab";
        // line 51
        if (((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "languages")) {
            echo " activetab";
        }
        echo "\" id=\"ext_details_languages_tab\"><a href=\"";
        echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
        echo "&amp;ext_show=languages\"><i class=\"fa fa-language\"></i> <span>";
        echo $this->env->getExtension('phpbb')->lang("EXT_DETAILS_LANGUAGES");
        echo "</span></a></li>
\t\t\t<li class=\"tab";
        // line 52
        if (((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "filetree")) {
            echo " activetab";
        }
        echo "\" id=\"ext_details_filetree_tab\"><a href=\"";
        echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
        echo "&amp;ext_show=filetree\"><i class=\"fa fa-sitemap\"></i> <span>";
        echo $this->env->getExtension('phpbb')->lang("EXT_DETAILS_FILETREE");
        echo "</span></a></li>
\t\t\t<li class=\"tab";
        // line 53
        if (((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "tools")) {
            echo " activetab";
        }
        echo "\" id=\"ext_details_tools_tab\"><a href=\"";
        echo (isset($context["U_EXT_DETAILS"]) ? $context["U_EXT_DETAILS"] : null);
        echo "&amp;ext_show=tools\"><i class=\"fa fa-wrench\"></i> <span>";
        echo $this->env->getExtension('phpbb')->lang("EXT_DETAILS_TOOLS");
        echo "</span></a></li>
\t\t</ul>
\t</div>
\t<div class=\"ext_details_block\" data-load-full-page=\"";
        // line 56
        echo (isset($context["S_LOAD_FULL_PAGE"]) ? $context["S_LOAD_FULL_PAGE"] : null);
        echo "\">
\t\t";
        // line 57
        if (((isset($context["EXT_DETAILS_MARKDOWN"]) ? $context["EXT_DETAILS_MARKDOWN"] : null) &&  !(isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null))) {
            // line 58
            echo "\t\t<div class=\"ext_details_markdown\" style=\"display:block;\">";
            echo (isset($context["EXT_DETAILS_MARKDOWN"]) ? $context["EXT_DETAILS_MARKDOWN"] : null);
            echo "</div>
\t\t";
        }
        // line 60
        echo "\t\t";
        if (((isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null) || (isset($context["S_EXT_DETAILS_SHOW_LANGUAGES"]) ? $context["S_EXT_DETAILS_SHOW_LANGUAGES"] : null))) {
            // line 61
            echo "\t\t<div class=\"ext_details_markdown\" id=\"ext_details_readme\">";
            echo (isset($context["EXT_DETAILS_README"]) ? $context["EXT_DETAILS_README"] : null);
            echo "</div>
\t\t<div class=\"ext_details_markdown\" id=\"ext_details_changelog\">";
            // line 62
            echo (isset($context["EXT_DETAILS_CHANGELOG"]) ? $context["EXT_DETAILS_CHANGELOG"] : null);
            echo "</div>
\t\t";
        }
        // line 64
        echo "        ";
        if (((((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "faq") || (isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null)) || (isset($context["S_EXT_DETAILS_SHOW_LANGUAGES"]) ? $context["S_EXT_DETAILS_SHOW_LANGUAGES"] : null))) {
            // line 65
            echo "        <div id=\"ext_details_faq\" data-ext-show-faq=\"";
            echo (isset($context["S_EXT_DETAILS_SHOW_FAQ"]) ? $context["S_EXT_DETAILS_SHOW_FAQ"] : null);
            echo "\"";
            if (( !(isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null) &&  !(isset($context["S_EXT_DETAILS_SHOW_LANGUAGES"]) ? $context["S_EXT_DETAILS_SHOW_LANGUAGES"] : null))) {
                echo " style=\"display:block;\"";
            }
            echo ">
\t\t\t<h1>";
            // line 66
            echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_EXT_HELP");
            echo "</h1>
            ";
            // line 67
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "upload_ext_faq_block", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["upload_ext_faq_block"]) {
                // line 68
                echo "            <div id=\"upload_ext_faq_item_";
                echo $this->getAttribute($context["upload_ext_faq_block"], "SECTION_NUMBER", array());
                echo "\">
                <span class=\"upload_ext_faq_title\">";
                // line 69
                echo $this->getAttribute($context["upload_ext_faq_block"], "BLOCK_TITLE", array());
                echo "</span>
                ";
                // line 70
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["upload_ext_faq_block"], "faq_row", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["faq_row"]) {
                    // line 71
                    echo "                <div class=\"upload_ext_faq\">
                    <span class=\"upload_ext_faq_question\">";
                    // line 72
                    echo $this->getAttribute($context["faq_row"], "FAQ_QUESTION", array());
                    echo "</span>
                    <div class=\"upload_ext_faq_answer\">";
                    // line 73
                    echo $this->getAttribute($context["faq_row"], "FAQ_ANSWER", array());
                    echo "</div>
                </div>
                ";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['faq_row'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 76
                echo "            </div>
            ";
                // line 77
                if ( !$this->getAttribute($context["upload_ext_faq_block"], "S_LAST_ROW", array())) {
                    echo "<hr class=\"dashed\" />";
                }
                // line 78
                echo "            ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['upload_ext_faq_block'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 79
            echo "        </div>
        ";
        }
        // line 81
        echo "\t\t";
        if (((isset($context["EXT_DETAILS_LANGUAGES"]) ? $context["EXT_DETAILS_LANGUAGES"] : null) || (isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null))) {
            // line 82
            echo "\t\t<div id=\"ext_languages\" data-ext-show-languages=\"";
            echo (isset($context["S_EXT_DETAILS_SHOW_LANGUAGES"]) ? $context["S_EXT_DETAILS_SHOW_LANGUAGES"] : null);
            echo "\"";
            if ( !(isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null)) {
                echo " style=\"display:block;\"";
            }
            echo ">
\t\t\t";
            // line 83
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "ext_languages", array()))) {
                // line 84
                echo "\t\t\t<form method=\"post\" action=\"";
                echo (isset($context["U_DELETE_ACTION"]) ? $context["U_DELETE_ACTION"] : null);
                echo "\" data-ajax=\"language_rows_delete\" data-refresh=\"true\">
\t\t\t\t<fieldset id=\"ext_languages_list\">
\t\t\t\t\t<span class=\"description_title ext_languages_title\">";
                // line 86
                echo $this->env->getExtension('phpbb')->lang("EXT_LANGUAGES");
                echo "</span>
\t\t\t\t\t";
                // line 87
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "ext_languages", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["ext_languages"]) {
                    // line 88
                    echo "\t\t\t\t\t<div class=\"ext_language_row\">
\t\t\t\t\t\t<span class=\"ext_language_name\">";
                    // line 89
                    echo $this->getAttribute($context["ext_languages"], "NAME", array());
                    echo "</span>
\t\t\t\t\t\t<div class=\"ext_language_actions\">
\t\t\t\t\t\t\t<input type=\"checkbox\" class=\"radio ext_check_box\" name=\"mark[]\" value=\"";
                    // line 91
                    echo $this->getAttribute($context["ext_languages"], "NAME", array());
                    echo "\" />
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>
\t\t\t\t\t";
                    // line 94
                    if ( !$this->getAttribute($context["ext_languages"], "S_LAST_ROW", array())) {
                        echo "<hr class=\"dashed\" />";
                    }
                    // line 95
                    echo "\t\t\t\t\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['ext_languages'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 96
                echo "\t\t\t\t\t<fieldset class=\"quick\">
\t\t\t\t\t\t<p class=\"small ext_mark_check\"><a href=\"#\" onclick=\"marklist('ext_languages_list', 'mark', true); return false;\">";
                // line 97
                echo $this->env->getExtension('phpbb')->lang("MARK_ALL");
                echo "</a> &bull; <a href=\"#\" onclick=\"marklist('ext_languages_list', 'mark', false); return false;\">";
                echo $this->env->getExtension('phpbb')->lang("UNMARK_ALL");
                echo "</a></p>
\t\t\t\t\t\t<button class=\"ext_language_delete\" type=\"submit\" name=\"delmarked\"><i class=\"fa fa-trash\"></i> ";
                // line 98
                echo $this->env->getExtension('phpbb')->lang("DELETE_MARKED");
                echo "</button>
\t\t\t\t\t</fieldset>
\t\t\t\t</fieldset>
\t\t\t</form>
\t\t\t";
            }
            // line 103
            echo "\t\t\t<form action=\"";
            echo (isset($context["U_UPLOAD"]) ? $context["U_UPLOAD"] : null);
            echo "\" method=\"post\" id=\"ext_upload\" autocomplete=\"off\" ";
            echo (isset($context["S_FORM_ENCTYPE"]) ? $context["S_FORM_ENCTYPE"] : null);
            echo ">
\t\t\t\t<fieldset>
\t\t\t\t\t<div id=\"ext_upload_content\">
\t\t\t\t\t\t<span class=\"ext_upload_form_name\"><i class=\"fa fa-upload fa-lg\"></i> ";
            // line 106
            echo $this->env->getExtension('phpbb')->lang("EXT_LANGUAGES_UPLOAD");
            echo "</span>
\t\t\t\t\t\t<p class=\"ext_upload_form_explain\">";
            // line 107
            echo $this->env->getExtension('phpbb')->lang("EXT_LANGUAGES_UPLOAD_EXPLAIN");
            echo "</p>
\t\t\t\t\t\t<input type=\"text\" id=\"remote_upload\" name=\"remote_upload\" />
\t\t\t\t\t\t<input type=\"button\" id=\"button_upload\" style=\"display:none;\" value=\"";
            // line 109
            echo $this->env->getExtension('phpbb')->lang("BROWSE");
            echo "\" onclick=\"browseFile();\" />
\t\t\t\t\t\t<input type=\"file\" id=\"extupload\" name=\"extupload\" accept=\".zip\" onchange=\"setFileName();\" />
\t\t\t\t\t\t";
            // line 111
            echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
            echo "
\t\t\t\t\t\t";
            // line 112
            echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
            echo "
\t\t\t\t\t\t<span class=\"br_form_upload\"></span>
\t\t\t\t\t\t<label for=\"ext_language_code\">";
            // line 114
            echo $this->env->getExtension('phpbb')->lang("EXT_LANGUAGE_ISO_CODE");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t\t\t\t\t\t<input type=\"text\" id=\"ext_language_code\" name=\"ext_lang_name\" />
\t\t\t\t\t\t<label for=\"ext_checksum\">";
            // line 116
            echo $this->env->getExtension('phpbb')->lang("CHECKSUM");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t\t\t\t\t\t<input type=\"radio\" name=\"ext_checksum_type\" id=\"ext_checksum_type_md5\" value=\"md5\" checked=\"checked\" />
\t\t\t\t\t\t<label for=\"ext_checksum_type_md5\">md5</label>
\t\t\t\t\t\t<input type=\"radio\" name=\"ext_checksum_type\" id=\"ext_checksum_type_sha1\" value=\"sha1\" />
\t\t\t\t\t\t<label for=\"ext_checksum_type_sha1\">sha1</label>
\t\t\t\t\t\t<input type=\"text\" id=\"ext_checksum\" name=\"ext_checksum\" />
\t\t\t\t\t\t<input type=\"hidden\" name=\"ext_name\" value=\"";
            // line 122
            echo (isset($context["META_NAME"]) ? $context["META_NAME"] : null);
            echo "\" />
\t\t\t\t\t\t<button class=\"upload_ext_upload_button\" type=\"submit\" name=\"submit\" value=\"";
            // line 123
            echo $this->env->getExtension('phpbb')->lang("UPLOAD");
            echo "\" id=\"submit\"><i class=\"fa fa-upload\"></i> ";
            echo $this->env->getExtension('phpbb')->lang("UPLOAD");
            echo "</button>
\t\t\t\t\t</div>
\t\t\t\t\t<i id=\"upload\" class=\"fa fa-spinner fa-3x fa-spin\"></i>
\t\t\t\t</fieldset>
\t\t\t</form>
\t\t</div>
\t\t";
        }
        // line 130
        echo "\t\t";
        if (((isset($context["EXT_DETAILS_FILETREE"]) ? $context["EXT_DETAILS_FILETREE"] : null) || (isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null))) {
            // line 131
            echo "\t\t<div id=\"filetree\"";
            if (( !(isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null) &&  !(isset($context["S_EXT_DETAILS_SHOW_LANGUAGES"]) ? $context["S_EXT_DETAILS_SHOW_LANGUAGES"] : null))) {
                echo " style=\"display:block;\"";
            }
            echo ">
\t\t\t<div id=\"filetreenames\">";
            // line 132
            echo (isset($context["FILETREE"]) ? $context["FILETREE"] : null);
            echo "</div>
\t\t\t<div id=\"filecontent_wrapper\">
\t\t\t\t<div id=\"filecontent\"><div class=\"filename\">";
            // line 134
            echo (isset($context["FILENAME"]) ? $context["FILENAME"] : null);
            echo "</div><div class=\"filecontent\">";
            echo (isset($context["CONTENT"]) ? $context["CONTENT"] : null);
            echo "</div></div>
\t\t\t\t<span class=\"select_all_code\">";
            // line 135
            echo $this->env->getExtension('phpbb')->lang("SELECT_ALL_CODE");
            echo "</span>
\t\t\t</div>
\t\t</div>
\t\t";
        }
        // line 139
        echo "\t\t";
        if (((isset($context["EXT_DETAILS_TOOLS"]) ? $context["EXT_DETAILS_TOOLS"] : null) || (isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null))) {
            // line 140
            echo "\t\t<div id=\"ext_details_tools\"";
            if (( !(isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null) &&  !(isset($context["S_EXT_DETAILS_SHOW_LANGUAGES"]) ? $context["S_EXT_DETAILS_SHOW_LANGUAGES"] : null))) {
                echo " style=\"display:block;\"";
            }
            echo ">
\t\t\t<fieldset class=\"description_fieldset description_update_form\">
\t\t\t\t<span class=\"description_title\"><i class=\"fa fa-download fa-lg\"></i> ";
            // line 142
            echo $this->env->getExtension('phpbb')->lang("EXT_TOOLS_DOWNLOAD_TITLE");
            echo "</span>
\t\t\t\t<form action=\"";
            // line 143
            echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
            echo "&amp;action=download&amp;ext_name=";
            echo (isset($context["META_NAME"]) ? $context["META_NAME"] : null);
            echo "\" method=\"post\">
\t\t\t\t\t<span class=\"description_update_form_explain\">";
            // line 144
            echo $this->env->getExtension('phpbb')->lang("EXT_TOOLS_DOWNLOAD");
            echo "</span>
\t\t\t\t\t<input type=\"checkbox\" name=\"ext_delete_suffix\" id=\"ext_delete_suffix\" title=\"";
            // line 145
            echo $this->env->getExtension('phpbb')->lang("EXT_TOOLS_DOWNLOAD_DELETE_SUFFIX");
            echo "\" />
\t\t\t\t\t<label for=\"ext_delete_suffix\">";
            // line 146
            echo $this->env->getExtension('phpbb')->lang("EXT_TOOLS_DOWNLOAD_DELETE_SUFFIX");
            echo "</label>
\t\t\t\t\t<input class=\"button1\" type=\"submit\" name=\"submit\" value=\"";
            // line 147
            echo $this->env->getExtension('phpbb')->lang("DOWNLOAD");
            echo "\" />
\t\t\t\t</form>
\t\t\t</fieldset>
\t\t</div>
\t\t";
        }
        // line 152
        echo "\t\t";
        if ((((((( !(isset($context["EXT_DETAILS_MARKDOWN"]) ? $context["EXT_DETAILS_MARKDOWN"] : null) &&  !(isset($context["EXT_DETAILS_LANGUAGES"]) ? $context["EXT_DETAILS_LANGUAGES"] : null)) &&  !(isset($context["EXT_DETAILS_FILETREE"]) ? $context["EXT_DETAILS_FILETREE"] : null)) &&  !(isset($context["EXT_DETAILS_TOOLS"]) ? $context["EXT_DETAILS_TOOLS"] : null)) &&  !((isset($context["SHOW_DETAILS_TAB"]) ? $context["SHOW_DETAILS_TAB"] : null) == "faq")) || (isset($context["HAS_AJAX"]) ? $context["HAS_AJAX"] : null)) || (isset($context["S_EXT_DETAILS_SHOW_LANGUAGES"]) ? $context["S_EXT_DETAILS_SHOW_LANGUAGES"] : null))) {
            // line 153
            echo "\t\t<div id=\"ext_details_content\">
\t\t\t";
            // line 154
            if (((isset($context["S_UPLOAD_VERSIONCHECK"]) ? $context["S_UPLOAD_VERSIONCHECK"] : null) &&  !(isset($context["S_UPLOAD_UP_TO_DATE"]) ? $context["S_UPLOAD_UP_TO_DATE"] : null))) {
                // line 155
                echo "\t\t\t";
                if ( !(isset($context["U_UPLOAD_EXT_UPDATE"]) ? $context["U_UPLOAD_EXT_UPDATE"] : null)) {
                    // line 156
                    echo "\t\t\t<div class=\"ext_solution_notice upload_ext_update_notice\">
\t\t\t\t<h1><i class=\"fa fa-lightbulb-o fa-fw\"></i> ";
                    // line 157
                    echo $this->env->getExtension('phpbb')->lang("EXT_UPDATE_METHODS_TITLE");
                    echo "</h1>
\t\t\t\t<span>";
                    // line 158
                    echo $this->env->getExtension('phpbb')->lang("EXT_UPLOAD_UPDATE_METHODS");
                    echo "</span>
\t\t\t</div>
\t\t\t";
                } else {
                    // line 161
                    echo "\t\t\t<fieldset>
\t\t\t<div class=\"description_title\">";
                    // line 162
                    echo $this->env->getExtension('phpbb')->lang("EXTENSION_UPLOAD_UPDATE");
                    echo "</div>
\t\t\t";
                }
                // line 164
                echo "\t\t\t";
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "upload_updates_available", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["upload_updates_available"]) {
                    // line 165
                    echo "\t\t\t";
                    if ($this->getAttribute($context["upload_updates_available"], "download", array())) {
                        // line 166
                        echo "\t\t\t<span class=\"updater_link_source\"><strong>";
                        echo $this->env->getExtension('phpbb')->lang("SOURCE");
                        echo $this->env->getExtension('phpbb')->lang("COLON");
                        echo "</strong> ";
                        echo $this->getAttribute($context["upload_updates_available"], "download", array());
                        echo "</span>
\t\t\t";
                    } else {
                        // line 168
                        echo "\t\t\t<span class=\"updater_link_source\"><strong>";
                        echo $this->env->getExtension('phpbb')->lang("EXTENSION_UPDATE_NO_LINK");
                        echo "</strong></span>
\t\t\t";
                    }
                    // line 170
                    echo "\t\t\t<fieldset style=\"background-color: #fdfcd3;\">
\t\t\t\t<span class=\"requirements_title\">";
                    // line 171
                    echo $this->env->getExtension('phpbb')->lang("LATEST_VERSION");
                    echo "</span>
\t\t\t\t<div class=\"extension_latest_version_wrapper\">
\t\t\t\t\t<strong class=\"extension_latest_version\">";
                    // line 173
                    echo $this->getAttribute($context["upload_updates_available"], "current", array());
                    echo "</strong>
\t\t\t\t\t";
                    // line 174
                    if ($this->getAttribute($context["upload_updates_available"], "announcement", array())) {
                        // line 175
                        echo "\t\t\t\t\t<a href=\"";
                        echo $this->getAttribute($context["upload_updates_available"], "announcement", array());
                        echo "\" class=\"extension_announcement_link\" title=\"";
                        echo $this->getAttribute($context["upload_updates_available"], "announcement", array());
                        echo "\" target=\"_blank\"><i class=\"fa fa-bullhorn\"></i><span>";
                        echo $this->env->getExtension('phpbb')->lang("ANNOUNCEMENT_TOPIC");
                        echo "</span></a>
\t\t\t\t\t";
                    }
                    // line 177
                    echo "\t\t\t\t\t";
                    if ($this->getAttribute($context["upload_updates_available"], "download", array())) {
                        // line 178
                        echo "\t\t\t\t\t";
                        if ((isset($context["U_UPLOAD_EXT_UPDATE"]) ? $context["U_UPLOAD_EXT_UPDATE"] : null)) {
                            // line 179
                            echo "\t\t\t\t\t<form class=\"upload_update_form\" action=\"";
                            echo (isset($context["U_UPLOAD_EXT_UPDATE"]) ? $context["U_UPLOAD_EXT_UPDATE"] : null);
                            echo "\" method=\"post\">
\t\t\t\t\t\t<input type=\"hidden\" name=\"remote_upload\" value=\"";
                            // line 180
                            echo $this->getAttribute($context["upload_updates_available"], "download", array());
                            echo "\" />
\t\t\t\t\t\t<button type=\"submit\" name=\"submit\" value=\"";
                            // line 181
                            echo $this->env->getExtension('phpbb')->lang("UPDATE");
                            echo "\" class=\"extension_get_update_link\" title=\"";
                            echo $this->env->getExtension('phpbb')->lang("DOWNLOAD_LATEST");
                            echo "\"><i class=\"fa fa-refresh\"></i> ";
                            echo $this->env->getExtension('phpbb')->lang("UPDATE");
                            echo "</button>
\t\t\t\t\t</form>
\t\t\t\t\t";
                        } else {
                            // line 184
                            echo "\t\t\t\t\t<a href=\"";
                            echo $this->getAttribute($context["upload_updates_available"], "download", array());
                            echo "\" class=\"extension_author_link\" title=\"";
                            echo $this->env->getExtension('phpbb')->lang("DOWNLOAD_LATEST");
                            echo "\"><i class=\"fa fa-download\"></i></a>
\t\t\t\t\t";
                        }
                        // line 186
                        echo "\t\t\t\t\t";
                    }
                    // line 187
                    echo "\t\t\t\t</div>
\t\t\t</fieldset>
\t\t\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['upload_updates_available'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 190
                echo "\t\t\t";
                if ((isset($context["U_UPLOAD_EXT_UPDATE"]) ? $context["U_UPLOAD_EXT_UPDATE"] : null)) {
                    // line 191
                    echo "\t\t\t<span class=\"updater_link_explain\">";
                    echo $this->env->getExtension('phpbb')->lang("EXTENSION_TO_BE_ENABLED");
                    echo "</span>
\t\t\t</fieldset>
\t\t\t";
                }
                // line 194
                echo "\t\t\t";
            }
            // line 195
            echo "\t\t\t";
            if ((isset($context["META_DESCRIPTION"]) ? $context["META_DESCRIPTION"] : null)) {
                // line 196
                echo "\t\t\t<fieldset class=\"description_fieldset\">
\t\t\t\t<span id=\"meta_description\" class=\"description_title\">";
                // line 197
                echo $this->env->getExtension('phpbb')->lang("DESCRIPTION");
                echo "</span>
\t\t\t\t<fieldset class=\"ext_description_column1\">
\t\t\t\t\t<div>
\t\t\t\t\t\t<h1 style=\"color: #706e25; background-color: #fdfcd3;\"><i class=\"fa fa-upload\"></i> ";
                // line 200
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_UPLOAD");
                echo "</h1>
\t\t\t\t\t\t<p class=\"description_list\">
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-database\"></i> ";
                // line 202
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_UPLOAD_CDB");
                echo "</span>
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-laptop\"></i> ";
                // line 203
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_UPLOAD_LOCAL");
                echo "</span>
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-cloud\"></i> ";
                // line 204
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_UPLOAD_REMOTE");
                echo "</span>
\t\t\t\t\t\t</p>
\t\t\t\t\t</div>
\t\t\t\t</fieldset>
\t\t\t\t<fieldset class=\"ext_description_column2\">
\t\t\t\t\t<div>
\t\t\t\t\t\t<h1 style=\"color: #1e5c18; background-color: #d7fdd3;\"><i class=\"fa fa-refresh\"></i> ";
                // line 210
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_UPDATE");
                echo "</h1>
\t\t\t\t\t\t<p>";
                // line 211
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_UPDATE_ABOUT");
                echo "</p>
\t\t\t\t\t</div>
\t\t\t\t</fieldset>
\t\t\t\t<br style=\"clear: both;\" />
\t\t\t\t<fieldset class=\"ext_description_column1\">
\t\t\t\t\t<div>
\t\t\t\t\t\t<h1 style=\"color: #5e1043; background-color: #fcdff2;\"><i class=\"fa fa-cogs\"></i> ";
                // line 217
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_MANAGE");
                echo "</h1>
\t\t\t\t\t\t<p class=\"description_list\">
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-power-off\"></i> ";
                // line 219
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_MANAGE_ACTIONS");
                echo "</span>
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-language\"></i> ";
                // line 220
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_MANAGE_LANG");
                echo "</span>
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-sitemap\"></i> ";
                // line 221
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_MANAGE_DETAILS");
                echo "</span>
\t\t\t\t\t\t</p>
\t\t\t\t\t</div>
\t\t\t\t</fieldset>
\t\t\t\t<fieldset class=\"ext_description_column2\">
\t\t\t\t\t<div>
\t\t\t\t\t\t<h1 style=\"color: #181a57; background-color: #d3e2fd;\"><i class=\"fa fa-tasks\"></i> ";
                // line 227
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_DESIGN");
                echo "</h1>
\t\t\t\t\t\t<p>";
                // line 228
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_DESIGN_ABOUT");
                echo "</p>
\t\t\t\t\t</div>
\t\t\t\t</fieldset>
\t\t\t\t<br style=\"clear: both;\" />
\t\t\t\t<fieldset class=\"ext_description_column1\">
\t\t\t\t\t<div>
\t\t\t\t\t\t<h1 style=\"color: #103f53; background-color: #e0f5fe;\"><i class=\"fa fa-archive\"></i> ";
                // line 234
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_ZIP");
                echo "</h1>
\t\t\t\t\t\t<p class=\"description_list\">
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-folder-open\"></i> ";
                // line 236
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_ZIP_SAVE");
                echo "</span>
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-suitcase\"></i> ";
                // line 237
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_ZIP_UNPACK");
                echo "</span>
\t\t\t\t\t\t\t<span><i class=\"fa fa-fw fa-download\"></i> ";
                // line 238
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_ZIP_DOWNLOAD");
                echo "</span>
\t\t\t\t\t\t</p>
\t\t\t\t\t</div>
\t\t\t\t</fieldset>
\t\t\t\t<fieldset class=\"ext_description_column2\">
\t\t\t\t\t<div>
\t\t\t\t\t\t<h1 style=\"color: #761129; background-color: #fcdde0;\"><i class=\"fa fa-paint-brush\"></i> ";
                // line 244
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_CLEANER");
                echo "</h1>
\t\t\t\t\t\t<p>";
                // line 245
                echo $this->env->getExtension('phpbb')->lang("UPLOAD_DESCRIPTION_CLEANER_ABOUT");
                echo "</p>
\t\t\t\t\t</div>
\t\t\t\t</fieldset>
\t\t\t</fieldset>
\t\t\t";
            }
            // line 250
            echo "\t\t\t<fieldset>
\t\t\t\t<div class=\"description_bubble big_bubble\">
\t\t\t\t\t<span class=\"description_name\">";
            // line 252
            echo $this->env->getExtension('phpbb')->lang("CLEAN_NAME");
            echo "</span>
\t\t\t\t\t<strong class=\"description_value\" id=\"meta_name\">";
            // line 253
            echo (isset($context["META_NAME"]) ? $context["META_NAME"] : null);
            echo "</strong>
\t\t\t\t</div>
\t\t\t\t";
            // line 255
            if ((isset($context["META_HOMEPAGE"]) ? $context["META_HOMEPAGE"] : null)) {
                // line 256
                echo "\t\t\t\t<div class=\"description_bubble big_bubble\">
\t\t\t\t\t<span class=\"description_name\">";
                // line 257
                echo $this->env->getExtension('phpbb')->lang("HOMEPAGE");
                echo "</span>
\t\t\t\t\t<strong class=\"description_value\" id=\"meta_homepage\"><a href=\"";
                // line 258
                echo (isset($context["META_HOMEPAGE"]) ? $context["META_HOMEPAGE"] : null);
                echo "\" title=\"";
                echo (isset($context["META_HOMEPAGE"]) ? $context["META_HOMEPAGE"] : null);
                echo "\" target=\"_blank\"><i class=\"fa fa-globe\"></i></a></strong>
\t\t\t\t</div>
\t\t\t\t";
            }
            // line 261
            echo "\t\t\t\t";
            if ((isset($context["META_TIME"]) ? $context["META_TIME"] : null)) {
                // line 262
                echo "\t\t\t\t<div class=\"description_bubble small_bubble\">
\t\t\t\t\t<span class=\"description_name\">";
                // line 263
                echo $this->env->getExtension('phpbb')->lang("TIME");
                echo "</span>
\t\t\t\t\t<span class=\"description_value\" id=\"meta_time\">";
                // line 264
                echo (isset($context["META_TIME"]) ? $context["META_TIME"] : null);
                echo "</span>
\t\t\t\t</div>
\t\t\t\t";
            }
            // line 267
            echo "\t\t\t\t<div class=\"description_bubble small_bubble\">
\t\t\t\t\t<span class=\"description_name\">";
            // line 268
            echo $this->env->getExtension('phpbb')->lang("LICENSE");
            echo "</span>
\t\t\t\t\t<span class=\"description_value\" id=\"meta_license\">";
            // line 269
            echo (isset($context["META_LICENSE"]) ? $context["META_LICENSE"] : null);
            echo "</span>
\t\t\t\t</div>
\t\t\t</fieldset>
\t\t\t";
            // line 272
            if (((isset($context["META_REQUIRE_PHPBB"]) ? $context["META_REQUIRE_PHPBB"] : null) || (isset($context["META_REQUIRE_PHP"]) ? $context["META_REQUIRE_PHP"] : null))) {
                // line 273
                echo "\t\t\t<fieldset>
\t\t\t\t<span class=\"requirements_title\">";
                // line 274
                echo $this->env->getExtension('phpbb')->lang("REQUIREMENTS");
                echo "</span>
\t\t\t\t";
                // line 275
                if ((isset($context["META_REQUIRE_PHPBB"]) ? $context["META_REQUIRE_PHPBB"] : null)) {
                    // line 276
                    echo "\t\t\t\t<div class=\"requirements_bubble\">
\t\t\t\t\t<span class=\"requirements_name\">";
                    // line 277
                    echo $this->env->getExtension('phpbb')->lang("PHPBB_VERSION");
                    echo "</span>
\t\t\t\t\t<span class=\"requirements_value";
                    // line 278
                    if ((isset($context["META_REQUIRE_PHPBB_FAIL"]) ? $context["META_REQUIRE_PHPBB_FAIL"] : null)) {
                        echo " requirements_value_not_met";
                    }
                    echo "\" id=\"require_phpbb\">";
                    echo (isset($context["META_REQUIRE_PHPBB"]) ? $context["META_REQUIRE_PHPBB"] : null);
                    echo "</span>
\t\t\t\t</div>
\t\t\t\t";
                }
                // line 281
                echo "\t\t\t\t";
                if ((isset($context["META_REQUIRE_PHP"]) ? $context["META_REQUIRE_PHP"] : null)) {
                    // line 282
                    echo "\t\t\t\t<div class=\"requirements_bubble\">
\t\t\t\t\t<span class=\"requirements_name\">";
                    // line 283
                    echo $this->env->getExtension('phpbb')->lang("PHP_VERSION");
                    echo "</span>
\t\t\t\t\t<span class=\"requirements_value";
                    // line 284
                    if ((isset($context["META_REQUIRE_PHP_FAIL"]) ? $context["META_REQUIRE_PHP_FAIL"] : null)) {
                        echo " requirements_value_not_met";
                    }
                    echo "\" id=\"require_php\">";
                    echo (isset($context["META_REQUIRE_PHP"]) ? $context["META_REQUIRE_PHP"] : null);
                    echo "</span>
\t\t\t\t</div>
\t\t\t\t";
                }
                // line 287
                echo "\t\t\t</fieldset>
\t\t\t";
            }
            // line 289
            echo "\t\t\t<fieldset>
\t\t\t\t";
            // line 290
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "meta_authors", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["meta_authors"]) {
                // line 291
                echo "\t\t\t\t";
                if ($this->getAttribute($context["meta_authors"], "S_FIRST_ROW", array())) {
                    // line 292
                    echo "\t\t\t\t";
                    if ($this->getAttribute($context["meta_authors"], "S_LAST_ROW", array())) {
                        // line 293
                        echo "\t\t\t\t<span class=\"requirements_title\">";
                        echo $this->env->getExtension('phpbb')->lang("DEVELOPER");
                        echo "</span>
\t\t\t\t";
                    } else {
                        // line 295
                        echo "\t\t\t\t<span class=\"requirements_title\">";
                        echo $this->env->getExtension('phpbb')->lang("DEVELOPERS");
                        echo "</span>
\t\t\t\t";
                    }
                    // line 297
                    echo "\t\t\t\t";
                }
                // line 298
                echo "\t\t\t\t<div class=\"extension_author\">
\t\t\t\t\t<strong class=\"extension_author_name\">";
                // line 299
                echo $this->getAttribute($context["meta_authors"], "AUTHOR_NAME", array());
                echo "</strong>
\t\t\t\t\t";
                // line 300
                if ($this->getAttribute($context["meta_authors"], "AUTHOR_EMAIL", array())) {
                    // line 301
                    echo "\t\t\t\t\t<a href=\"mailto:";
                    echo $this->getAttribute($context["meta_authors"], "AUTHOR_EMAIL", array());
                    echo "\" title=\"";
                    echo $this->env->getExtension('phpbb')->lang("AUTHOR_EMAIL");
                    echo "\" class=\"extension_author_link\"><i class=\"fa fa-envelope\"></i></a>
\t\t\t\t\t";
                }
                // line 303
                echo "\t\t\t\t\t";
                if ($this->getAttribute($context["meta_authors"], "AUTHOR_HOMEPAGE", array())) {
                    // line 304
                    echo "\t\t\t\t\t<a href=\"";
                    echo $this->getAttribute($context["meta_authors"], "AUTHOR_HOMEPAGE", array());
                    echo "\" title=\"";
                    echo $this->env->getExtension('phpbb')->lang("AUTHOR_HOMEPAGE");
                    echo "\" class=\"extension_author_link\" target=\"_blank\"><i class=\"fa fa-globe\"></i></a>
\t\t\t\t\t";
                }
                // line 306
                echo "\t\t\t\t</div>
\t\t\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['meta_authors'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 308
            echo "\t\t\t</fieldset>
\t\t</div>
\t\t";
        }
        // line 311
        echo "\t</div>
</div>
";
    }

    public function getTemplateName()
    {
        return "acp_ext_details.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  963 => 311,  958 => 308,  951 => 306,  943 => 304,  940 => 303,  932 => 301,  930 => 300,  926 => 299,  923 => 298,  920 => 297,  914 => 295,  908 => 293,  905 => 292,  902 => 291,  898 => 290,  895 => 289,  891 => 287,  881 => 284,  877 => 283,  874 => 282,  871 => 281,  861 => 278,  857 => 277,  854 => 276,  852 => 275,  848 => 274,  845 => 273,  843 => 272,  837 => 269,  833 => 268,  830 => 267,  824 => 264,  820 => 263,  817 => 262,  814 => 261,  806 => 258,  802 => 257,  799 => 256,  797 => 255,  792 => 253,  788 => 252,  784 => 250,  776 => 245,  772 => 244,  763 => 238,  759 => 237,  755 => 236,  750 => 234,  741 => 228,  737 => 227,  728 => 221,  724 => 220,  720 => 219,  715 => 217,  706 => 211,  702 => 210,  693 => 204,  689 => 203,  685 => 202,  680 => 200,  674 => 197,  671 => 196,  668 => 195,  665 => 194,  658 => 191,  655 => 190,  647 => 187,  644 => 186,  636 => 184,  626 => 181,  622 => 180,  617 => 179,  614 => 178,  611 => 177,  601 => 175,  599 => 174,  595 => 173,  590 => 171,  587 => 170,  581 => 168,  572 => 166,  569 => 165,  564 => 164,  559 => 162,  556 => 161,  550 => 158,  546 => 157,  543 => 156,  540 => 155,  538 => 154,  535 => 153,  532 => 152,  524 => 147,  520 => 146,  516 => 145,  512 => 144,  506 => 143,  502 => 142,  494 => 140,  491 => 139,  484 => 135,  478 => 134,  473 => 132,  466 => 131,  463 => 130,  451 => 123,  447 => 122,  437 => 116,  431 => 114,  426 => 112,  422 => 111,  417 => 109,  412 => 107,  408 => 106,  399 => 103,  391 => 98,  385 => 97,  382 => 96,  376 => 95,  372 => 94,  366 => 91,  361 => 89,  358 => 88,  354 => 87,  350 => 86,  344 => 84,  342 => 83,  333 => 82,  330 => 81,  326 => 79,  320 => 78,  316 => 77,  313 => 76,  304 => 73,  300 => 72,  297 => 71,  293 => 70,  289 => 69,  284 => 68,  280 => 67,  276 => 66,  267 => 65,  264 => 64,  259 => 62,  254 => 61,  251 => 60,  245 => 58,  243 => 57,  239 => 56,  227 => 53,  217 => 52,  207 => 51,  196 => 50,  183 => 49,  171 => 48,  161 => 47,  156 => 44,  150 => 41,  146 => 40,  143 => 39,  141 => 38,  135 => 35,  132 => 34,  130 => 33,  124 => 30,  121 => 29,  119 => 28,  112 => 26,  108 => 25,  104 => 24,  101 => 23,  99 => 22,  97 => 21,  91 => 18,  87 => 17,  84 => 16,  78 => 13,  74 => 12,  69 => 11,  67 => 10,  62 => 8,  58 => 7,  53 => 6,  51 => 5,  47 => 4,  32 => 2,  19 => 1,);
    }
}
