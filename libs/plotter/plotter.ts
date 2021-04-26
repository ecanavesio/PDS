import GnuPlot from 'gnu-plot';

export class Plotter {

  /**
   * @desc Entity with represent the instance of process that is running in background
   */
  gnuplot: GnuPlot;

  constructor() {
    this.gnuplot = GnuPlot();
  }
}