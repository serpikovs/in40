<?php
/*
 * Проект: Katrin
 * Шаблонизатор (сборка 3)
 */

if (!defined('Katrin'))
    die ('Access Error');

// Создаем объект шаблонизатора
$current_theme = 'default';			    // TODO из настроек
$tpl_loader = new TemplateLoader($current_theme);
$page_areas = array();


/**
 * Класс-шаблонизатор 
 */
class TemplateLoader
{
    public $full_tpls_path;
    private $_vars = array();
    
    /**
     *
     * @param type $current_theme название текущей темы
     */
    public function __construct($current_theme = 'default') 
    {
	$this->full_tpls_path = 'themes/'.$current_theme;
    }
    
    public function __get($name)
    {
	if (isset($this->_vars[$name])) 
	    return $this->_vars[$name];
	return '';
    }

    /**
     * Заполняет один шаблон
     * @param string $current_tpl требуемый для заполнения шаблон
     * @param array $vars ассоциативный массив переменных
     * @return string Заполненный шаблон 
     */
    public function Load($current_tpl, $vars=NULL) //TODO возможны значения по умолчанию
    {	
	// добавляем расширение, если нет
	if (preg_match('/.tpl$/', $current_tpl) == 0)
	    $current_tpl.='.tpl';
	
	$this->_vars = $vars;
	
	// проверяем на наличие шаблона:
	if (!file_exists($this->full_tpls_path.'/'.$current_tpl)) 
	    die('Шаблона '.$this->full_tpls_path.'/'.$current_tpl.' не существует!');

	// загружаем шаблон
	ob_start();
	include($this->full_tpls_path."/".$current_tpl);
	return ob_get_clean();
    }
}

?>
