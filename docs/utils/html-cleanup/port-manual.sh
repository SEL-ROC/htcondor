#!/bin/bash

cd src
for HtmlCleanupFilename in *.html; do
	../html-cleanup.py $HtmlCleanupFilename ../dst/$HtmlCleanupFilename.out
done
cd ../dst


# Overview
#pandoc -f html -t rst Overview.html.out -o ../../../overview/index.rst
pandoc -f html -t rst HighThroughputComputingHTCanditsRequirements.html.out -o ../../../overview/high-throughput-computing-requirements.rst
pandoc -f html -t rst HTCondorsPower.html.out -o ../../../overview/htcondors-power.rst
pandoc -f html -t rst ExceptionalFeatures.html.out -o ../../../overview/exceptional-features.rst
pandoc -f html -t rst CurrentLimitations.html.out -o ../../../overview/current-limitations.rst
pandoc -f html -t rst Availability.html.out -o ../../../overview/availability.rst
pandoc -f html -t rst ContributionsandAcknowledgments.html.out -o ../../../overview/contributions-and-acknowledgments.rst
pandoc -f html -t rst ContactInformation.html.out -o ../../../overview/contact-information.rst
pandoc -f html -t rst PrivacyNotice.html.out -o ../../../overview/privacy-notice.rst

# User's Manual
#pandoc -f html -t rst UsersManual.html.out -o ../../../users-manual/index.rst
pandoc -f html -t rst WelcometoHTCondor.html.out -o ../../../users-manual/welcome-to-htcondor.rst
pandoc -f html -t rst Introduction.html.out -o ../../../users-manual/introduction-users-manual.rst
pandoc -f html -t rst MatchmakingwithClassAds.html.out -o ../../../users-manual/matchmaking-with-classads.rst
pandoc -f html -t rst RunningaJobtheStepsToTake.html.out -o ../../../users-manual/running-a-job-steps.rst
pandoc -f html -t rst SubmittingaJob.html.out -o ../../../users-manual/submitting-a-job.rst
pandoc -f html -t rst ManagingaJob.html.out -o ../../../users-manual/managing-a-job.rst
pandoc -f html -t rst PrioritiesandPreemption.html.out -o ../../../users-manual/priorities-and-preemption.rst
pandoc -f html -t rst JavaApplications.html.out -o ../../../users-manual/java-applications.rst
pandoc -f html -t rst ParallelApplicationsIncludingMPIApplications.html.out -o ../../../users-manual/parallel-applications.rst
pandoc -f html -t rst DAGManApplications.html.out -o ../../../users-manual/dagman-applications.rst
pandoc -f html -t rst VirtualMachineApplications.html.out -o ../../../users-manual/virtual-machine-applications.rst
pandoc -f html -t rst DockerUniverseApplications.html.out -o ../../../users-manual/docker-universe-applications.rst
pandoc -f html -t rst TimeSchedulingforJobExecution.html.out -o ../../../users-manual/time-scheduling-for-job-execution.rst
pandoc -f html -t rst SpecialEnvironmentConsiderations.html.out -o ../../../users-manual/special-environment-considerations.rst
pandoc -f html -t rst PotentialProblems.html.out -o ../../../users-manual/potential-problems.rst

# Administrator's Manual
#pandoc -f html -t rst AdministratorsManual.html.out -o ../../../admin-manual/index.rst
pandoc -f html -t rst Introduction1.html.out -o ../../../admin-manual/introduction-admin-manual.rst
pandoc -f html -t rst InstallationStartUpShutDownandReconfiguration.html.out -o ../../../admin-manual/installation-startup-shutdown-reconfiguration.rst
pandoc -f html -t rst IntroductiontoConfiguration.html.out -o ../../../admin-manual/introduction-to-configuration.rst
pandoc -f html -t rst ConfigurationTemplates.html.out -o ../../../admin-manual/configuration-templates.rst
pandoc -f html -t rst ConfigurationMacros.html.out -o ../../../admin-manual/configuration-macros.rst
pandoc -f html -t rst UserPrioritiesandNegotiation.html.out -o ../../../admin-manual/user-priorities-negotiation.rst
pandoc -f html -t rst PolicyConfigurationforExecuteHostsandforSubmitHosts.html.out -o ../../../admin-manual/policy-configuration.rst
pandoc -f html -t rst Security.html.out -o ../../../admin-manual/security.rst
pandoc -f html -t rst NetworkingincludessectionsonPortUsageandCCB.html.out -o ../../../admin-manual/networking.rst
pandoc -f html -t rst TheCheckpointServer.html.out -o ../../../admin-manual/checkpoint-server.rst
pandoc -f html -t rst DaemonCore.html.out -o ../../../admin-manual/daemoncore.rst
pandoc -f html -t rst Monitoring.html.out -o ../../../admin-manual/monitoring.rst
pandoc -f html -t rst TheHighAvailabilityofDaemons.html.out -o ../../../admin-manual/high-availability.rst
pandoc -f html -t rst SettingUpforSpecialEnvironments.html.out -o ../../../admin-manual/setting-up-special-environments.rst
pandoc -f html -t rst JavaSupportInstallation.html.out -o ../../../admin-manual/java-support-installation.rst
pandoc -f html -t rst SettingUptheVMandDockerUniverses.html.out -o ../../../admin-manual/setting-up-vm-docker-universes.rst
pandoc -f html -t rst SingularitySupport.html.out -o ../../../admin-manual/singularity-support.rst
pandoc -f html -t rst PowerManagement.html.out -o ../../../admin-manual/power-management.rst

# Miscellaneous Concepts
#pandoc -f html -t rst MiscellaneousConcepts.html.out -o ../../../misc-concepts/index.rst
pandoc -f html -t rst HTCondorsClassAdMechanism.html.out -o ../../../misc-concepts/classad-mechanism.rst
pandoc -f html -t rst HTCondorsCheckpointMechanism.html.out -o ../../../misc-concepts/checkpoint-mechanism.rst
pandoc -f html -t rst ComputingOnDemandCOD.html.out -o ../../../misc-concepts/computing-on-demand.rst
pandoc -f html -t rst Hooks.html.out -o ../../../misc-concepts/hooks.rst
pandoc -f html -t rst LogginginHTCondor.html.out -o ../../../misc-concepts/logging.rst

# Grid Computing
#pandoc -f html -t rst GridComputing.html.out -o ../../../grid-computing/index.rst
pandoc -f html -t rst Introduction2.html.out -o ../../../grid-computing/introduction-grid-computing.rst
pandoc -f html -t rst ConnectingHTCondorPoolswithFlocking.html.out -o ../../../grid-computing/connecting-pools-with-flocking.rst
pandoc -f html -t rst TheGridUniverse.html.out -o ../../../grid-computing/grid-universe.rst
pandoc -f html -t rst TheHTCondorJobRouter.html.out -o ../../../grid-computing/job-router.rst

# Cloud Computing
#pandoc -f html -t rst CloudComputing.html.out -o ../../../cloud-computing/index.rst
pandoc -f html -t rst Introduction3.html.out -o ../../../cloud-computing/introduction-cloud-computing.rst
pandoc -f html -t rst HTCondorAnnexUsersGuide.html.out -o ../../../cloud-computing/annex-users-guide.rst
pandoc -f html -t rst UsingCondorannexfortheFirstTime.html.out -o ../../../cloud-computing/using-annex-first-time.rst
pandoc -f html -t rst HTCondorAnnexCustomizationGuide.html.out -o ../../../cloud-computing/annex-customization-guide.rst
pandoc -f html -t rst HTCondorAnnexConfiguration.html.out -o ../../../cloud-computing/annex-configuration.rst

# Application Programming Interfaces (APIs)
#pandoc -f html -t rst ApplicationProgrammingInterfacesAPIs.html.out -o ../../../apis/index.rst
pandoc -f html -t rst PythonBindings.html.out -o ../../../apis/python-bindings.rst
pandoc -f html -t rst Chirp.html.out -o ../../../apis/chirp.rst
pandoc -f html -t rst TheHTCondorUserandJobLogReaderAPI.html.out -o ../../../apis/user-job-log-reader-api.rst
pandoc -f html -t rst TheCommandLineInterface.html.out -o ../../../apis/command-line-interface.rst
pandoc -f html -t rst TheDRMAAAPI.html.out -o ../../../apis/drmaa-api.rst

# Platform-Specific Information
#pandoc -f html -t rst PlatformSpecificInformation.html.out -o ../../../platform-specific/index.rst
pandoc -f html -t rst Linux.html.out -o ../../../platform-specific/linux.rst
pandoc -f html -t rst MicrosoftWindows.html.out -o ../../../platform-specific/microsoft-windows.rst
pandoc -f html -t rst MacintoshOSX.html.out -o ../../../platform-specific/macintosh-osx.rst

# Frequently Asked Questions
#pandoc -f html -t rst FrequentlyAskedQuestionsFAQ.html.out -o ../../../faq/index.rst

# Contrib and Source Modules
#pandoc -f html -t rst ContribandSourceModules.html.out -o ../../../contrib-source-modules/index.rst
pandoc -f html -t rst Introduction4.html.out -o ../../../contrib-source-modules/introduction-contrib-source-modules.rst
pandoc -f html -t rst TheHTCondorViewClientContribModule.html.out -o ../../../contrib-source-modules/view-client-contrib-module.rst
pandoc -f html -t rst JobMonitorLogViewer.html.out -o ../../../contrib-source-modules/job-monitor-log-viewer.rst

# Version History and Release Notes
#pandoc -f html -t rst VersionHistoryandReleaseNotes.html.out -o ../../../version-history/index.rst
pandoc -f html -t rst IntroductiontoHTCondorVersions.html.out -o ../../../version-history/introduction-version-history.rst
pandoc -f html -t rst Upgradingfromthe86seriestothe88seriesofHTCondor.html.out -o ../../../version-history/upgrading-from-86-to-88-series.rst
pandoc -f html -t rst DevelopmentReleaseSeries89.html.out -o ../../../version-history/development-release-series-89.rst
pandoc -f html -t rst StableReleaseSeries88.html.out -o ../../../version-history/stable-release-series-88.rst
pandoc -f html -t rst DevelopmentReleaseSeries87.html.out -o ../../../version-history/development-release-series-87.rst
pandoc -f html -t rst StableReleaseSeries86.html.out -o ../../../version-history/stable-release-series-86.rst

# Command Reference Manual (man-pages)
#pandoc -f html -t rst CommandReferenceManualmanpages.html.out -o ../../../man-pages/index.rst
pandoc -f html -t rst Boscocluster.html.out -o ../../../man-pages/bosco_cluster.rst
pandoc -f html -t rst Boscofindplatform.html.out -o ../../../man-pages/bosco_findplatform.rst
pandoc -f html -t rst Boscoinstall.html.out -o ../../../man-pages/bosco_install.rst
pandoc -f html -t rst Boscosshstart.html.out -o ../../../man-pages/bosco_sshstart.rst
pandoc -f html -t rst Boscostart.html.out -o ../../../man-pages/bosco_start.rst
pandoc -f html -t rst Boscostop.html.out -o ../../../man-pages/bosco_stop.rst
pandoc -f html -t rst Boscouninstall.html.out -o ../../../man-pages/bosco_uninstall.rst
pandoc -f html -t rst Condoradvertise.html.out -o ../../../man-pages/condor_advertise.rst
pandoc -f html -t rst Condorannex.html.out -o ../../../man-pages/condor_annex.rst
pandoc -f html -t rst Condorcheckpoint.html.out -o ../../../man-pages/condor_checkpoint.rst
pandoc -f html -t rst Condorcheckuserlogs.html.out -o ../../../man-pages/condor_check_userlogs.rst
pandoc -f html -t rst Condorchirp.html.out -o ../../../man-pages/condor_chirp.rst
pandoc -f html -t rst Condorcod.html.out -o ../../../man-pages/condor_cod.rst
pandoc -f html -t rst Condorcompile.html.out -o ../../../man-pages/condor_compile.rst
pandoc -f html -t rst Condorconfigure.html.out -o ../../../man-pages/condor_configure.rst
pandoc -f html -t rst Condorconfigval.html.out -o ../../../man-pages/condor_config_val.rst
pandoc -f html -t rst Condorcontinue.html.out -o ../../../man-pages/condor_continue.rst
pandoc -f html -t rst Condorconverthistory.html.out -o ../../../man-pages/condor_convert_history.rst
pandoc -f html -t rst Condordagman.html.out -o ../../../man-pages/condor_dagman.rst
pandoc -f html -t rst Condordagmanmetricsreporter.html.out -o ../../../man-pages/condor_dagman_metrics_reporter.rst
pandoc -f html -t rst Condordrain.html.out -o ../../../man-pages/condor_drain.rst
pandoc -f html -t rst Condorfetchlog.html.out -o ../../../man-pages/condor_fetchlog.rst
pandoc -f html -t rst Condorfindhost.html.out -o ../../../man-pages/condor_findhost.rst
pandoc -f html -t rst Condorgatherinfo.html.out -o ../../../man-pages/condor_gather_info.rst
pandoc -f html -t rst Condorgpudiscovery.html.out -o ../../../man-pages/condor_gpu_discovery.rst
pandoc -f html -t rst Condorhistory.html.out -o ../../../man-pages/condor_history.rst
pandoc -f html -t rst Condorhold.html.out -o ../../../man-pages/condor_hold.rst
pandoc -f html -t rst Condorinstall.html.out -o ../../../man-pages/condor_install.rst
pandoc -f html -t rst Condorjobrouterinfo.html.out -o ../../../man-pages/condor_job_router_info.rst
pandoc -f html -t rst Condormaster.html.out -o ../../../man-pages/condor_master.rst
pandoc -f html -t rst Condornow.html.out -o ../../../man-pages/condor_now.rst
pandoc -f html -t rst Condoroff.html.out -o ../../../man-pages/condor_off.rst
pandoc -f html -t rst Condoron.html.out -o ../../../man-pages/condor_on.rst
pandoc -f html -t rst Condorping.html.out -o ../../../man-pages/condor_ping.rst
pandoc -f html -t rst Condorpooljobreport.html.out -o ../../../man-pages/condor_pool_job_report.rst
pandoc -f html -t rst Condorpower.html.out -o ../../../man-pages/condor_power.rst
pandoc -f html -t rst Condorpreen.html.out -o ../../../man-pages/condor_preen.rst
pandoc -f html -t rst Condorprio.html.out -o ../../../man-pages/condor_prio.rst
pandoc -f html -t rst Condorprocd.html.out -o ../../../man-pages/condor_procd.rst
pandoc -f html -t rst Condorqedit.html.out -o ../../../man-pages/condor_qedit.rst
pandoc -f html -t rst Condorq.html.out -o ../../../man-pages/condor_q.rst
pandoc -f html -t rst Condorqsub.html.out -o ../../../man-pages/condor_qsub.rst
pandoc -f html -t rst Condorreconfig.html.out -o ../../../man-pages/condor_reconfig.rst
pandoc -f html -t rst Condorrelease.html.out -o ../../../man-pages/condor_release.rst
pandoc -f html -t rst Condorreschedule.html.out -o ../../../man-pages/condor_reschedule.rst
pandoc -f html -t rst Condorrestart.html.out -o ../../../man-pages/condor_restart.rst
pandoc -f html -t rst Condorrmdir.html.out -o ../../../man-pages/condor_rmdir.rst
pandoc -f html -t rst Condorrm.html.out -o ../../../man-pages/condor_rm.rst
pandoc -f html -t rst Progcondorrouterhistory.html.out -o ../../../man-pages/condor_router_history.rst
pandoc -f html -t rst Progcondorrouterq.html.out -o ../../../man-pages/condor_router_q.rst
pandoc -f html -t rst Condorrouterrm.html.out -o ../../../man-pages/condor_router_rm.rst
pandoc -f html -t rst Condorrun.html.out -o ../../../man-pages/condor_run.rst
pandoc -f html -t rst Condorsetshutdown.html.out -o ../../../man-pages/condor_set_shutdown.rst
pandoc -f html -t rst Condorsos.html.out -o ../../../man-pages/condor_sos.rst
pandoc -f html -t rst Condorsshtojob.html.out -o ../../../man-pages/condor_sshtojob.rst
pandoc -f html -t rst Condorstats.html.out -o ../../../man-pages/condor_stats.rst
pandoc -f html -t rst Condorstatus.html.out -o ../../../man-pages/condor_status.rst
pandoc -f html -t rst Condorstorecred.html.out -o ../../../man-pages/condor_storecred.rst
pandoc -f html -t rst Condorsubmitdag.html.out -o ../../../man-pages/condor_submitdag.rst
pandoc -f html -t rst Condorsubmit.html.out -o ../../../man-pages/condor_submit.rst
pandoc -f html -t rst Condorsuspend.html.out -o ../../../man-pages/condor_suspend.rst
pandoc -f html -t rst Condortail.html.out -o ../../../man-pages/condor_tail.rst
pandoc -f html -t rst Condortop.html.out -o ../../../man-pages/condor_top.rst
pandoc -f html -t rst Condortransferdata.html.out -o ../../../man-pages/condor_transfer_data.rst
pandoc -f html -t rst Condortransformads.html.out -o ../../../man-pages/condor_transform_ads.rst
pandoc -f html -t rst Condorupdatemachinead.html.out -o ../../../man-pages/condor_update_machine_ad.rst
pandoc -f html -t rst Condorupdatesstats.html.out -o ../../../man-pages/condor_updates_stats.rst
pandoc -f html -t rst Condorurlfetch.html.out -o ../../../man-pages/condor_urlfetch.rst
pandoc -f html -t rst Condoruserlog.html.out -o ../../../man-pages/condor_userlog.rst
pandoc -f html -t rst Condoruserprio.html.out -o ../../../man-pages/condor_userprio.rst
pandoc -f html -t rst Condorvacate.html.out -o ../../../man-pages/condor_vacate.rst
pandoc -f html -t rst Condorvacatejob.html.out -o ../../../man-pages/condor_vacate_job.rst
pandoc -f html -t rst Condorversion.html.out -o ../../../man-pages/condor_version.rst
pandoc -f html -t rst Condorwait.html.out -o ../../../man-pages/condor_wait.rst
pandoc -f html -t rst Condorwho.html.out -o ../../../man-pages/condor_who.rst
pandoc -f html -t rst giddalloc.html.out -o ../../../man-pages/giddalloc.rst
pandoc -f html -t rst procdctl.html.out -o ../../../man-pages/procdctl.rst

# ClassAd Attributes
#pandoc -f html -t rst ClassAdAttributes.html.out -o ../../../classad-attributes/index.rst
pandoc -f html -t rst ClassAdTypes.html.out -o ../../../classad-attributes/classad-types.rst
pandoc -f html -t rst JobClassAdAttributes.html.out -o ../../../classad-attributes/job-classad-attributes.rst
pandoc -f html -t rst MachineClassAdAttributes.html.out -o ../../../classad-attributes/machine-classad-attributes.rst
pandoc -f html -t rst DaemonMasterClassAdAttributes.html.out -o ../../../classad-attributes/daemon-master-classad-attributes.rst
pandoc -f html -t rst SchedulerClassAdAttributes.html.out -o ../../../classad-attributes/scheduler-classad-attributes.rst
pandoc -f html -t rst NegotiatorClassAdAttributes.html.out -o ../../../classad-attributes/negotiator-classad-attributes.rst
pandoc -f html -t rst SubmitterClassAdAttributes.html.out -o ../../../classad-attributes/submitter-classad-attributes.rst
pandoc -f html -t rst DefragClassAdAttributes.html.out -o ../../../classad-attributes/defrag-classad-attributes.rst
pandoc -f html -t rst CollectorClassAdAttributes.html.out -o ../../../classad-attributes/collector-classad-attributes.rst
pandoc -f html -t rst ClassAdAttributesAddedbytheCondorcollector.html.out -o ../../../classad-attributes/classad-attributes-added-by-collector.rst
pandoc -f html -t rst DaemonCoreStatisticsAttributes.html.out -o ../../../classad-attributes/daemon-core-statistics-attributes.rst

# Codes and Other Needed Values
#pandoc -f html -t rst CodesandOtherNeededValues.html.out -o ../../../codes-other-values/index.rst
pandoc -f html -t rst CondorshadowExitCodes.html.out -o ../../../codes-other-values/condor_shadow-exit-codes.rst
pandoc -f html -t rst JobEventLogCodes.html.out -o ../../../codes-other-values/job-event-log-codes.rst
pandoc -f html -t rst WellknownPortNumbers.html.out -o ../../../codes-other-values/well-known-port-numbers.rst
pandoc -f html -t rst DaemonCoreCommandNumbers.html.out -o ../../../codes-other-values/daemoncore-command-numbers.rst
pandoc -f html -t rst DaemonCoreDaemonExitCodes.html.out -o ../../../codes-other-values/daemoncore-daemon-exit-codes.rst

cd ..
