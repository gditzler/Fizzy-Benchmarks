#!/usr/bin/env python
import json
import numpy as np
import pandas as pd
import matplotlib.pylab as plt

__authors__ = "Gregory Ditzler"
__copyright__ = "Copyright 2014, EESI Laboratory (Drexel University)"
__license__ = "GPL"
__maintainer__ = "Gregory Ditzler"
__email__ = "gregory.ditzler@gmail.com"

def boxplot(map_fp, fizzy_result_fp, label_col, output_fp, groups, delta=.00055):
    """
    boxplot()
    """
    mapf = pd.read_csv(map_fp, sep="\t")[["#SampleID", label_col]]
    dobj = json.loads(open(fizzy_result_fp, "U").read())

    feats =  [d["metadata"]["taxonomy"] for d in dobj["rows"]]
    sample_ids = np.array([np.float(d["id"]) for d in dobj["columns"]])

    labels = []
    for n in range(len(sample_ids)):
        q = np.where(sample_ids[n] == mapf["#SampleID"])[0]
        if len(q) > 0:
            labels.append(mapf[label_col][q].tolist()[0])
    labels = np.array(labels)
    group1_data= np.array(dobj["data"])[np.where(labels == groups[0])]
    group2_data = np.array(dobj["data"])[np.where(labels == groups[1])]

    def set_box_color(bp, color):
        plt.setp(bp['boxes'], color=color)
        plt.setp(bp['whiskers'], color=color)
        plt.setp(bp['caps'], color=color)
        plt.setp(bp['medians'], color=color)


    fig = plt.figure(dpi=500)
    try:
        bpl = plt.boxplot(group1_data[:,:10], positions=np.array(xrange(len(group1_data[:,:10])))*2.0-0.4, sym='', widths=0.6)
    except:
        bpl = plt.gca()
        print "Caught error."

    try:
        bpr = plt.boxplot(group2_data[:,:10], positions=np.array(xrange(len(group2_data)))*2.0+0.4, sym='', widths=0.6)
    except:
        bpr = plt.gca()
        print "Caught error."

    plt.xlim([-1,19])
    ax1 = plt.gca()

    plt.xticks(np.arange(0, 19+1, 2.0))


    #for n,f in enumerate(feats[:10]):
    #    fnew = f.replace("[","").replace("]","").replace('"',"").replace(" ","")
    #    plt.text(20, .005-n*delta, "("+str(2*n)+") "+fnew,fontsize=19)

    plt.title("Rel. Abundance of Top OTUs")
    plt.ylabel('rel. abundance', fontsize=18)
    plt.rc('font',**{'family':'sans-serif','sans-serif':['Helvetica'],'size':18})
    plt.rc('figure', **{'autolayout': True})
    #plt.savefig("ag-mf-relabunbar.pdf")


def feature_histograms(map_fp, fizzy_result_fp, label_col, groups):
    """
    """
    mapf = pd.read_csv(map_fp, sep="\t")[["#SampleID", label_col]]
    dobj = json.loads(open(fizzy_result_fp, "U").read())

    feats =  [d["metadata"]["taxonomy"] for d in dobj["rows"]]
    sample_ids = np.array([np.float(d["id"]) for d in dobj["columns"]])

    labels = []
    for n in range(len(sample_ids)):
        q = np.where(sample_ids[n] == mapf["#SampleID"])[0]
        if len(q) > 0:
            labels.append(mapf[label_col][q].tolist()[0])
    labels = np.array(labels)
    group1_data = np.array(dobj["data"])[np.where(labels == groups[0])]
    group2_data = np.array(dobj["data"])[np.where(labels == groups[1])]

    fi = plt.figure()
    f, ax = plt.subplots(2, 5, sharex='col', sharey='row',figsize=(20, 5), dpi=500)
    n = 0

    for ax_i in ax:
        for ax_ij in ax_i:
            ax_ij.hist(group1_data[:,n], 15, histtype='stepfilled', color="blue", alpha=.4, label=groups[0])
            ax_ij.hist(group2_data[:,n], 15 , histtype='stepfilled', color="red", alpha=.4, label=groups[1])
            ax_ij.legend()
            ax_ij.ticklabel_format(axis='x', style='sci')
            print "("+str(1*(n >= 5))+","+str(n % 5)+") "+feats[n].replace("[","").replace("]","").replace('"',"").replace(" ","")
            n += 1

    plt.rc('font',**{'family':'sans-serif','sans-serif':['Helvetica'],'size':10})
    plt.xlim([0,.02])
    plt.rc('figure', **{'autolayout': True})
