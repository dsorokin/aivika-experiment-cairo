
-- |
-- Module     : Simulation.Aivika.Experiment.CairoRenderer
-- Copyright  : Copyright (c) 2012-2014, David Sorokin <david.sorokin@gmail.com>
-- License    : BSD3
-- Maintainer : David Sorokin <david.sorokin@gmail.com>
-- Stability  : experimental
-- Tested with: GHC 7.6.3
--
-- This module defines a renderer that uses the Chart-cairo library based on Cairo
-- for rendering charts with simulation results.
--

module Simulation.Aivika.Experiment.CairoRenderer
       (CairoRenderer(..)) where

import Graphics.Rendering.Chart
import Graphics.Rendering.Chart.Backend.Cairo

import Simulation.Aivika.Experiment
import Simulation.Aivika.Experiment.Chart

-- | This renderer uses the Chart-cairo library based on Cairo for rendering charts with simulation results.
data CairoRenderer = CairoRenderer FileFormat

instance FileRenderer CairoRenderer

instance ChartRenderer CairoRenderer where

  renderableFileExtension (CairoRenderer PNG) = ".png"
  renderableFileExtension (CairoRenderer SVG) = ".svg"
  renderableFileExtension (CairoRenderer PS)  = ".ps"
  renderableFileExtension (CairoRenderer PDF) = ".pdf"
  
  renderChart (CairoRenderer format) size =
    flip $ renderableToFile (FileOptions size format)

