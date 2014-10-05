
{-# LANGUAGE MultiParamTypeClasses #-}

-- |
-- Module     : Simulation.Aivika.Experiment.CairoRendering
-- Copyright  : Copyright (c) 2012-2014, David Sorokin <david.sorokin@gmail.com>
-- License    : BSD3
-- Maintainer : David Sorokin <david.sorokin@gmail.com>
-- Stability  : experimental
-- Tested with: GHC 7.8.3
--
-- This module defines a renderer that uses the Chart-cairo library based on Cairo
-- for rendering charts with simulation results.
--

module Simulation.Aivika.Experiment.CairoRendering
       (CairoRenderer(..)) where

import Graphics.Rendering.Chart
import Graphics.Rendering.Chart.Backend.Cairo

import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Chart

-- | This renderer uses the Chart-cairo library based on Cairo for rendering charts with simulation results.
data CairoRenderer = CairoRenderer FileFormat

-- | The class of the Cairo-based renderers is a sub-class of the charting renderers.
class WebPageCharting r => CairoRendering r

instance ExperimentRendering CairoRenderer WebPageWriter where

  renderExperiment e r = renderExperiment e WebPageRenderer

instance WebPageRendering CairoRenderer

instance WebPageCharting CairoRenderer where

  renderableChartExtension (CairoRenderer PNG) = ".png"
  renderableChartExtension (CairoRenderer SVG) = ".svg"
  renderableChartExtension (CairoRenderer PS)  = ".ps"
  renderableChartExtension (CairoRenderer PDF) = ".pdf"
  
  renderChart (CairoRenderer format) size =
    renderableToFile (FileOptions size format)

instance CairoRendering CairoRenderer
