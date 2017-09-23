
{-# LANGUAGE MultiParamTypeClasses #-}

-- |
-- Module     : Simulation.Aivika.Experiment.Chart.Backend.Cairo
-- Copyright  : Copyright (c) 2012-2017, David Sorokin <david.sorokin@gmail.com>
-- License    : BSD3
-- Maintainer : David Sorokin <david.sorokin@gmail.com>
-- Stability  : experimental
-- Tested with: GHC 7.10.1
--
-- This module defines a renderer that uses the Chart-cairo library based on Cairo
-- for rendering charts with simulation results.
--

module Simulation.Aivika.Experiment.Chart.Backend.Cairo
       (CairoRenderer(..)) where

import Data.Colour
import Data.Colour.Names

import Control.Lens

import Graphics.Rendering.Chart
import Graphics.Rendering.Chart.Backend.Cairo

import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Chart

-- | This renderer uses the Chart-cairo library based on Cairo for rendering charts with simulation results.
data CairoRenderer = CairoRenderer FileFormat

instance ChartRendering CairoRenderer where

  renderableChartExtension (CairoRenderer PNG) = ".png"
  renderableChartExtension (CairoRenderer SVG) = ".svg"
  renderableChartExtension (CairoRenderer PS)  = ".ps"
  renderableChartExtension (CairoRenderer PDF) = ".pdf"
  
  renderChart (CairoRenderer format) size =
    renderableToFile (FileOptions size format)

  renderingLayout (CairoRenderer _) = defaultLayout
  renderingLayoutLR (CairoRenderer _) = defaultLayoutLR

-- | Default font style.
defaultFontStyle :: FontStyle
defaultFontStyle =
  FontStyle "serif" 13 FontSlantNormal FontWeightNormal (opaque black) 

-- | Default title font style.
defaultTitleFontStyle :: FontStyle
defaultTitleFontStyle =
  FontStyle "serif" 18 FontSlantNormal FontWeightBold (opaque black) 

-- | The default layout.
defaultLayoutLR :: LayoutLR Double Double Double -> LayoutLR Double Double Double
defaultLayoutLR layoutlr =
  layoutlr_title_style .~ defaultTitleFontStyle $
  layoutlr_all_font_styles .~ defaultFontStyle $
  layoutlr

-- | The default layout.
defaultLayout :: Layout Double Double -> Layout Double Double
defaultLayout layout =
  layout_title_style .~ defaultTitleFontStyle $
  layout_all_font_styles .~ defaultFontStyle $
  layout
