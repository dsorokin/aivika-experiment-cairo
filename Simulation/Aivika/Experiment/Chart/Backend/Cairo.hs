
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
