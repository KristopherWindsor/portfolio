<?php

namespace Portfolio\Util;

class Colors {
  private $list;
  private $index;

  /**
   * @param int $upperbound the number of colors needed (or more)
   */
  public function __construct($upperbound){
    if ($upperbound <= 2)
      $this->list = array('#BCA', '#ABC');
    else if ($upperbound <= 6)
      $this->list = array('#ABC', '#BCA', '#CAB', '#ACB', '#BAC', '#CBA');
    else
      $this->list = self::getColors12();
    $this->index = -1;
  }

  public function getNext(){
    return $this->list[ ++$this->index ];
  }

  public function getCurrent(){
    return $this->list[ $this->index ];
  }

  private static function getColors12(){
    $colors = array();
    for ($r = 255 - 16 * 5; $r <= 255 - 16 * 2; $r += 16)
      for ($g = 255 - 16 * 5; $g <= 255 - 16 * 2; $g += 16)
        for ($b = 255 - 16 * 5; $b <= 255 - 16 * 2; $b += 16)
          if ($r != $g && $r != $b && $g != $b)
            $colors[ md5("$r.$g.$b") ] = "rgb($r, $g, $b)";
    unset($colors[md5('191.207.175')]);
    unset($colors[md5('223.207.175')]);
    unset($colors[md5('223.207.191')]);
    ksort($colors);
    return array_values($colors);
  }
}
