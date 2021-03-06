      

Development Release Series 8.9
==============================

This is the development release series of HTCondor. The details of each
version are described below.

Version 8.9.1
-------------

Release Notes:

-  HTCondor version 8.9.1 released on April 17, 2019.

New Features:

-  The deprecated ``HOSTALLOW…`` and ``HOSTDENY…`` configuration knobs
   have been removed. Please use ``ALLOW…`` and ``DENY…``. :ticket:`6921`
-  Implemented a new version of the curl\_plugin with multi-file
   support, allowing it to transfer many files in a single invocation of
   the plugin. :ticket:`6499`
   :ticket:`6859`
-  The performance of HTCondor's File Transfer mechanism has improved
   when sending multiple files, especially in wide-area network
   settings. :ticket:`6884`
-  Added support for passing HTTPS authentication credentials to file
   transfer plugins, using specially customized protocols. :ticket:`6858`
-  If a job requests GPUs and is a Docker Universe job, HTCondor
   automatically mounts the nVidia GPU devices. :ticket:`6910`
-  If a job requests GPUs, and Singularity is enabled, HTCondor
   automatically passes the **–nv** flag to Singularity to tell it to
   mount the nVidia GPUs. :ticket:`6898`
-  Added a new submit file option, ``docker_network_type = host``, which
   causes a docker universe job to use the host's network, instead of
   the default NATed interface. :ticket:`6906`
-  Added a new config knob, ``DOCKER_EXTRA_ARGUMENTS``, to allow admins
   to add arbitrary docker command line options to the docker create
   command. :ticket:`6900`
-  We've added six new events to the job event log, recording details
   about file transfer. For both file transfer -in (before/to the job)
   and -out (after/from the job), we log if the transfer was queued,
   when it started, and when it finished. If the event was queued, the
   start event will note for how long; the first transfer event written
   will additionally include the starter's address, which has not
   otherwise been printed.

   We've also added several transfer-related attributes to the job ad.
   For jobs which do file transfer, we now set
   ``JobCurrentFinishTransferOutputDate``, to complement
   ``JobCurrentStartTransferOutputDate``, as well as the corresponding
   attributes for input transfer: ``JobCurrentStartTransferInputDate``
   and ``JobCurrentFinishTransferInputDate``. The new attributes are
   added at the same time as ``JobCurrentStartTransferOutputDate``, that
   is, at job termination. This set of attributes use the older and more
   deceptive definitions of file transfer timing. To obtain the times
   recorded by the new events, instead reference ``TransferInQueued``,
   ``TransferInStarted``, ``TransferInFinished``, ``TransferOutQueued``,
   ``TransferOutStarted``, and ``TransferOutFinished``. HTCondor sets
   these attributes (roughly) at the time they occur. :ticket:`6854`

-  Added support for output file remaps for URLs. This allows users to
   specify a URL where they want individual output files to go, and once
   a job is complete, we automatically uploads the files there. We are
   preserving the older implementation (OutputDestination), which puts
   all output files in the same place, for backwards compatibility.
   :ticket:`6876`
-  Added options ``f`` (return full target string) and ``g`` (perform
   multiple substitutions) to ClassAd function ``regexps()``. Added new
   ClassAd functions ``replace()`` (equivalent to ``regexps()`` with
   ``f`` option) and ``replaceall()`` (equivalent to ``regexps()`` with
   ``fg`` options). :ticket:`6848`
-  When jobs are run without file transfer on, usually because there is
   a shared file system, HTCondor used to unconditionally set the jobs
   argv[0] to the string *condor\_exe.exe*. This breaks jobs that look
   at their own argv[0], in ways that are very hard to debug. In this
   release of HTCondor, we no longer do this. :ticket:`6943`

Bugs Fixed:

-  Avoid killing jobs using between 90% and 99% of memory limit.
   :ticket:`6925`
-  Improved how ``"Chirp"`` handles a network disconnection between the
   *condor\_starter* and *condor\_shadow*. ``"Chirp"`` commands now
   return a error and no longer cause the *condor\_starter* to exit
   (killing the job). :ticket:`6873`
-  Fixed a bug that could cause *condor\_submit* to send invalid job
   ClassAds to the *condor\_schedd* when the executable attribute was
   not the same for all jobs in that submission. :ticket:`6719`

Version 8.9.0
-------------

Release Notes:

-  HTCondor version 8.9.0 released on February 28, 2019.

Known Issues:

This release may require configuration changes to work as before. During
this release series, we are making changes to make it easier to deploy
secure pools. This release contains two security related configuration
changes.

-  Absent any configuration, the default behavior is to deny
   authorization to all users.
-  In the configuration files, if ``ALLOW_DAEMON`` or ``DENY_DAEMON``
   are omitted, ``ALLOW_WRITE`` or ``DENY_WRITE`` are no longer used in
   their place.

   On most pools, the easiest way to get the previous behavior is to add
   the following to your configuration:

   ::

       ALLOW_READ = * 
       ALLOW_DAEMON = $(ALLOW_WRITE)

   The main configuration file (``/etc/condor/condor_config``) already
   implements the above change by calling ``use SECURITY : HOST_BASED``.

   With the addition of the automatic security session for a family of
   HTCondor daemons and the existing match password authentication
   between the execute and submit daemons, most hosts in a pool may not
   require changes to the configuration files. On the central manager,
   you do need to ensure ``DAEMON`` level access for your submit nodes.
   Also, CCB requires ``DAEMON`` level access.

New Features:

-  Changed the default security behavior to deny authorization by
   default. Also, neither ``ALLOW_DAEMON`` nor ``DENY_DAEMON`` fall back
   to using the corresponding ``ALLOW_WRITE`` or ``DENY_WRITE`` when
   reading configuration files. :ticket:`6824`
-  A family of HTCondor daemons can now share a security session that
   allows them to trust each other without doing a security negotiation
   when a network connection is made amongst them. This “family”
   security session can be disabled by setting the new configuration
   parameter ``SEC_USE_FAMILY_SESSION`` to ``False``. :ticket:`6788`
-  Scheduler Universe jobs now start in order of priority, instead of
   random order. This is most typically used for DAGMan. When running
   *condor\_submit\_dag* against a .dag file, you can use the -priority
   <N> flag to set the priority for the overall *condor\_dagman* job.
   When the *condor\_schedd* is starting new Scheduler Universe jobs,
   the highest priority queued job will start first. If all queued
   Scheduler Universe jobs have equal priority, they get started in
   order of submission. :ticket:`6703`
-  Normally, HTCondor requires the user to specify their credentials
   when using EC2 (via the grid universe or via *condor\_annex*). This
   allows users to use different accounts from the same machine.
   However, if a user started an EC2 instance with the privileges
   necessary to start other instances, and ran HTCondor in that
   instance, HTCondor was unable to use that instance's privileges; the
   user still had to specify their credentials. Instead, the user may
   now specify ``FROM INSTANCE`` instead of the name of a credential
   file to indicate that HTCondor should use the instance's credentials.

   By default, any user with access to a privileged EC2 instance has
   access to that instance's privileges. If you would like to make use
   of this feature, please read `HTCondor Annex Customization
   Guide <../cloud-computing/annex-customization-guide.html>`__ before
   adding privileges (an instance role) to an instance which allows
   access by other users, specifically including the submitting of jobs
   to or running jobs on that instance. :ticket:`6789`

-  The *condor\_now* tool now supports vacating more than one job; the
   additional jobs' resources will be coalesced into a single slot, on
   which the now-job will be run. :ticket:`6694`
-  In the Python bindings, the ``JobEventLog`` class now has a ``close``
   method. It is also now its own iterable context manager (implements
   ``__enter__`` and ``__exit__``). The ``JobEvent`` class now
   implements ``__str__`` and ``__repr__``. :ticket:`6814`
-  the *condor\_hdfs* daemon which allowed the hdfs daemons to run under
   the *condor\_master* has been removed from the contributed source.
   :ticket:`6809`

Bugs Fixed:

-  Fixed potential authentication failures between the *condor\_schedd*
   and *condor\_startd* when multiple *condor\_startd*\ s are using the
   same shared port server. :ticket:`5604`

      
